#
# Cookbook Name:: frab
# Recipe:: default
#

case node[:platform]
when "debian", "ubuntu"

  # Refresh aptitude repository
  execute "aptitude-update" do
    command "aptitude update"
    action :run
  end

  # Install required packages for installation
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
  package "ruby"
  package "bundler"

  # Checkout frab from GitHub
  git node['frab']['install']['dir'] do
    repository node['frab']['git']['repository']
    reference node['frab']['install']['release']
    action :sync
  end

  # Install all necessary gems
  execute "bundle-install" do
    command "bundle install"
    cwd node['frab']['install']['dir']
    action :run
  end

  # Configure frab based from templates
  { "database.yml" => "database.yml.erb",
    "settings.yml" => "settings.yml.erb",
  }.each do |dest, source|
    template "#{node['frab']['install']['dir']}/config/#{dest}" do
      source "#{source}"
      owner "root"
      group "root"
      mode "0640"
    end
  end

  # Create and setup the database
  execute "db-setup" do
    command "rake db:setup RAILS_ENV=#{node['frab']['environment']}"
    cwd node['frab']['install']['dir']
    not_if  "mysql -h localhost -u #{node['frab']['database']['production']['username']} -p#{node['frab']['database']['production']['password']} -D #{node['frab']['database']['production']['database']} -e 'show databases;' | grep #{node['frab']['database']['production']['database']}"
    action :run
  end

  # Precompile assets
  execute "rake-precompile" do
    command "rake assets:precompile RAILS_ENV=#{node['frab']['environment']}"
    cwd node['frab']['install']['dir']
    action :run
  end

  execute "rake-secret" do
    command "rake secret RAILS_ENV=#{node['frab']['environment']}"
    cwd node['frab']['install']['dir']
    not_if { ::File.exists?("config/initializers/secret_token.rb")}
    action :run
  end

  execute "rake-secret-install" do
    command "cp config/initializers/secret_token.rb.example config/initializers/secret_token.rb"
    cwd node['frab']['install']['dir']
    not_if { ::File.exists?("config/initializers/secret_token.rb")}
    action :run
  end

  execute "rails-server" do
    command "rails server -e #{node['frab']['environment']} -d"
    cwd node['frab']['install']['dir']
    not_if { ::File.exists?("#{node['frab']['install']['dir']}/tmp/pids/server.pid")}
    action :run
  end
end
