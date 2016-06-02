class SynchroniseMeetupRecordsJob < ActiveJob::Base
  queue_as :low_priority

  def perform
    synchronise_events
    synchronise_photos
    synchronise_members
  end

  private

  def synchronise_events
    synced_event_ids = []

    # Meetup API doesn't support array: ['upcoming', 'past'] to be param values for :status, so split into two requests
    ['upcoming', 'past'].each do |status|
      results = RMeetup_client.fetch(:events, status: status, group_id: Rails.application.config.meetup_group_id)

      # update each record or create if not yet existing
      results.each do |result|
        result_hash = result.as_json

        event = Event.where(meetup_id: result.id).first_or_initialize
        if event.raw_data['updated'] != result_hash['event']['updated']
          event.raw_data = result_hash['event']
        end

        event.save! if event.changed?

        synced_event_ids << event.id
      end
    end

    # delete all records that are no longer existing remotely
    Event.where.not(id: synced_event_ids).destroy_all
  end

  def synchronise_photos
    # Check all photos for each event
    synced_photo_ids = []

    Event.all.each do |event|
      meetup_event_id = event.raw_data['id']
      results = RMeetup_client.fetch(:photos, event_id: meetup_event_id)

      # update each record or create if not yet existing
      results.each do |result|
        result_hash = result.as_json

        photo = event.photos.where(meetup_id: result.photo_id).first_or_initialize
        if photo.raw_data['updated'] != result_hash['photo']['updated']
          photo.raw_data = result_hash['photo']
        end

        photo.save! if photo.changed?

        synced_photo_ids << photo.id
      end
    end

    # delete all records that are no longer existing remotely
    Photo.where.not(id: synced_photo_ids).destroy_all
  end

  def synchronise_members
    synced_member_ids = []
    meetup_group_id = Rails.application.config.meetup_group_id
    results = RMeetup_client.fetch(:members, group_id: meetup_group_id)

    results.each do |result|
      result_hash = result.as_json

      # Fetched Members do not have an 'updated' json key, therefore we always update the member record to be always accurate
      member = Member.find_or_initialize_by(meetup_id: result.id)
      member.raw_data = result_hash['member']

      member.save!

      synced_member_ids << member.id
    end

    # delete all records that are no longer existing remotely
    Member.where.not(id: synced_member_ids).destroy_all
  end
end
