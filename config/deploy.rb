# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'dlror-web'
set :repo_url, 'git@github.com:dublin-learning-ruby-on-rails/dlror-web.git'

set :user, 'deploy'

set :rails_env, 'production'

set :deploy_via, :copy

set :rbenv_ruby, '2.3.0'

server 'dublinlearningrubyonrails.org', user: 'deploy', roles: %w{web app db}

# server 'dublinlearningrubyonrails.org', :app, :web, :db, :primary => true

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/srv/www/dlror-web'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, false # know bug for capistrano-sidekiq if set to true

set :ssh_options, {
  forward_agent: true,
  auth_methods: ['publickey'],
  keys: ['~/.ssh/dublinlearningrubyonrails.pem']
}

# Default value for :linked_files is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for linked_dirs is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/meetup.yml', 'config/delayed_job.yml')

# DelayedJob
set :delayed_job_queues, ['default', 'low_priority', 'high_priority', 'mailer']

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to true if using ActiveRecord

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
