class AddDelayedJobCronForSynchroniseMeetupRecordsJob < ActiveRecord::Migration
  def up
    SynchroniseMeetupRecordsJob.set(cron: '0,30 * * * *').perform_later
  end

  def down
    raise 'Need to manually remove the created job: Delayed::Job...destroy'
  end
end
