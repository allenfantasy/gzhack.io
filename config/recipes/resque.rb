namespace :resque do
  desc "Start Resque"
  task :start, roles: :app do
    run "cd #{current_path} RAILS_ENV=production PIDFILE=#{pid_dir}/resque.pid QUEUE=export BACKGROUND=yes bundle exec rake environment resque:work"
  end

  desc "Stop Resque"
  task :stop, roles: :app do
    run "kill `cat #{pid_dir}/resque.pid`"
  end
end
