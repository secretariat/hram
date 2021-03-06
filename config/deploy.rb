# -*- encoding : utf-8 -*-
require 'capistrano/ext/multistage'
require "bundler/capistrano"

set :application, "hram"
set :scm, :git
set :scm_verbose, true

set :default_shell, '/bin/bash -l'

set :repository,  "git@github.com:secretariat/hram.git"
set :deploy_to, "/home/user/www/sites/hram"
set :branch, 'master'

set :deploy_via, :copy
set :use_sudo, false
set :keep_releases, 5

role :web, "185.16.40.109"                          # Your HTTP server, Apache/etc
role :app, "185.16.40.109"                          # This may be the same as your `Web` server
role :db,  "185.16.40.109", :primary => true # This is where Rails migrations will run
role :db,  "185.16.40.109"

set :user, "user"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:auth_methods] = ["publickey"]
ssh_options[:port] = 2200
ssh_options[:keys] = ["#{ENV['HOME']}/install/ruby/amazon/vps.pem"]

set :stages, ["staging", "production"]
set :default_stage, "production"

after "deploy","deploy:bundle"
after "deploy:bundle", "deploy:assets"
after "deploy:assets", "deploy:migrations"
after "deploy:migrations", "deploy:restart"
after "deploy:create_symlink", "deploy:cleanup"
