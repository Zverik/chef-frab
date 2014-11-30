#
# Cookbook Name:: frab
# Recipe:: default
#

include_recipe 'nginx::source'

case node[:platform]
when "debian", "ubuntu"

  execute "aptitude-update" do
    command "aptitude update"
    action :run
  end

  package "imagemagick"
  package "libsqlite3-dev"
  package "libmysqlclient-dev"
  package "libpq-dev"
  package "libxml2-dev"
  package "libxslt-dev"
  package "nodejs"
  package "git"
  package "ruby1.9.1-dev"
  package "build-essential"
  package "bundler"

  gem_package "bcrypt-ruby" do
    options("-v '3.0.1'")
    action :install
  end

  git node['frab']['install']['dir'] do
    repository "https://github.com/frab/frab.git"
    reference "master"
    action :sync
  end

  execute "bundle-install" do
    command "bundle install"
    cwd node['frab']['install']['dir']
    action :run
  end

  execute "db-config" do
    command "cp config/database.yml.template config/database.yml"
    cwd node['frab']['install']['dir']
    creates 'config/database.yml'
    action :run
  end

  execute "frab-config" do
    command "cp config/settings.yml.template config/settings.yml"
    cwd node['frab']['install']['dir']
    creates 'config/settings.yml'
    action :run
  end

  execute "db-setup" do
    command "rake db:setup"
    cwd node['frab']['install']['dir']
    action :run
  end

  execute "rake-precompile" do
    command "rake assets:precompile"
    cwd node['frab']['install']['dir']
    action :run
  end

  execute "rake-secret" do
    command "cp config/initializers/secret_token.rb.example config/initializers/secret_token.rb"
    cwd node['frab']['install']['dir']
    action :run
  end

  execute "rails-server" do
    command "rails server -d"
    cwd node['frab']['install']['dir']
    action :run
  end
end
