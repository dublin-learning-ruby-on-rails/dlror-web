require 'rufus-scheduler'
require 'net/http'

scheduler = Rufus::Scheduler.singleton

scheduler.every '30m' do
  Rails.logger.info "#{Time.now}: STARTED SCHEDULED CRON JOB: SynchroniseMeetupRecordsJob"
  SynchroniseMeetupRecordsJob.perform_now
end

scheduler.every '1m' do
  # if server is down, restart
  http = Net::HTTP.new('localhost', 80)

  begin
    response = http.request_get('/')
  rescue => exception
    Rails.logger.error exception.message
  ensure
    unless response && response.code == "200"
      Rails.logger.info "Restarting server @ #{Time.now}"
      `cd /srv/www/dlror-web/current && bundle exec pumactl -P /srv/www/dlror-web/shared/tmp/pids/puma.pid restart`
    end
  end
end