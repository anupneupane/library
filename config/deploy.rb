require 'bundler/capistrano' # for bundler support
require 'sidekiq/capistrano' # to reload sidekiq on server on deploy

load "deploy/assets"

set :application, "library-app"
set :repository,  "git@github.com:flatiron-school/library.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true


set :user, 'deploy'
set :deploy_to, "/home/#{user}/#{application}"
set :use_sudo, false

default_run_options[:pty] = true

role :web, "198.211.100.163"                          # Your HTTP server, Apache/etc
role :app, "198.211.100.163"                          # This may be the same as your `Web` server
role :db,  "198.211.100.163", :primary => true # This is where Rails migrations will run


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
before "deploy:assets:precompile", "deploy:symlink_configs"
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_configs, :roles => :app do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config"
    run "ln -nfs #{shared_path}/twitter.yml #{release_path}/config"
    run "ln -nfs #{shared_path}/api_keys.yml #{release_path}/config"
  end
end

task :upload_confs, :roles => :app do
  upload('config/twitter.yml', "#{shared_path}/twitter.yml")
  upload('config/database.yml', "#{shared_path}/database.yml")
end
