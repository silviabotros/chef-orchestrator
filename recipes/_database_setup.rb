#
# Cookbook Name:: chef-orchestrator
# Recipe:: default
#
# Copyright (C) 2014 
#
# All rights reserved - Do Not Redistribute
#
%w{mysql-server mysql-client mysql-devel}.each do |pkg|
  package pkg
end

gem_package 'mysql'

service 'mysql' do
  action :start
end

execute "set root pass" do
  command  "mysqladmin -u root password \"#{node['orchestrator']['root_db_pass']}\""
  retries 5
  only_if "mysql -u root -e 'show databases'"
end

include_recipe 'database'
mysql_connection_info = {
  :host => 'localhost', 
  :port => '3306',
  :username => "root",
  :password => "node['orchestrator']['root_db_pass']"
}

mysql_database 'orchestrator' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'orchestrator' do
  connection mysql_connection_info
  password node['orchestrator']['orchestrator_db_pass']
  host 'localhost'
  database_name 'orchestrator'
  privileges [:all]
  action :grant
end
