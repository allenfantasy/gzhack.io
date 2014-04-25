require "rvm/capistrano"

set :bundle_cmd, "/home/deploy/.rvm/gems/ruby-2.1.1/bin/bundle"
set :bundle_dir, '/home/deploy/.rvm/gems/ruby-2.1.1'
set :rvm_ruby_version, 'ruby-2.1.1'
require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/check"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/database"
load "config/recipes/monit"
load "config/recipes/resque"
load "config/recipes/sitemap"


set :application, "gzhack"
set :user, "deploy"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :nginx_port, 80 # default port for nginx is 80. CHANGE THIS IF NEEDED

set :scm, :git
set :repository,  "git@github.com:allenfantasy/gzhack.io.git"
set :branch, "master"

set :pid_dir, "#{shared_path}/pids"
set :log_dir, "#{shared_path}/log"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only last 5 releases

namespace :deploy do

  task :default do
    update_code
    create_symlink
    db.migrate
    restart
  end
  task :start do
    nginx.start
    unicorn.start
  end

  task :restart do
    unicorn.restart
    resque.restart
  end

  task :setup_config, roles: :app do
    # uncomment this line if using ckeditor
    # run "mkdir -p #{shared_path}/ckeditor_assets"
    run "mkdir -p #{shared_path}/content"

    if File.exist?("config/application.yml")
      put File.read("config/application.yml"), "#{shared_path}/config/application.yml"
    end
    puts "Now edit the config files in #{shared_path}"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    # uncomment this line if using ckeditor
    # run "ln -s #{shared_path}/ckeditor_assets #{release_path}/public/ckeditor_assets"
    run "ln -nfs #{shared_path}/config/application.yml #{release_path}/config/application.yml"
    #run "ln -s #{shared_path}/content #{release_path}/public/content"
    run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

end

server "173.255.208.69", :web, :app, :db, primary: true
