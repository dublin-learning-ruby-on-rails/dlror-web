require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '30m' do
  Rails.logger.info "#{Time.now}: STARTED SCHEDULED CRON JOB: SynchroniseMeetupRecordsJob"
  SynchroniseMeetupRecordsJob.perform_now
end
