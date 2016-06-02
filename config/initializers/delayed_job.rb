Delayed::Worker.queue_attributes = {
  high_priority: { priority: -10 },
  default: { priority: 0 },
  mailer: { priority: 1 },
  low_priority: { priority: 10 }
}

delayed_job_config = YAML::load(File.open("#{ Rails.root }/config/meetup.yml"))[Rails.env]

if Rails.env.staging? or Rails.env.production?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    username == delayed_job_config['web']['username'] && password == delayed_job_config['web']['password']
  end
end
