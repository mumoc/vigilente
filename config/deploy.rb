require 'capistrano/rails'
require 'capistrano/rbenv'
require 'capistrano/puma'

# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'vigilente'
set :repo_url, 'git@github.com:crowdint/vigilente.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '~/vigilente'

# Default value for :scm is :git
set :scm, :git

# set :rbenv_type, :user
set :rbenv_ruby, '2.1.5'
set :rbenv_path, '/home/deploy/.rbenv/'
set :rbenv_map_bins, %w(rake gem bundle rails)

set :bundle_bins, %w(rake)

set :assets_prefix, 'assets'

set :linked_files, %w{config/database.yml config/newrelic.yml }

set :puma_conf, "#{shared_path}/config/puma.rb"