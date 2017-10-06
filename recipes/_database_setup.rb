#
# Author:: Silvia Botros (<silvia.botros@sendgrid.com>)
# Cookbook Name:: orchestrator
#
# Copyright (c) 2014
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['platform_family'] == 'debian'
  include_recipe 'apt'
  execute 'add percona apt key' do
    command 'apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9334A25F8507EFA5 && apt-get update'
    not_if 'apt-key list | grep -i percona'
  end
end

include_recipe 'build-essential'
include_recipe 'percona::server'
include_recipe 'percona::client'

package case node['platform_family']
        when 'rhel'
          %w(ruby ruby-devel rubygems binutils)
        when 'debian'
          %w(ruby ruby-dev libperconaserverclient18.1-dev)
        end

execute 'set root pass' do # ~FC037
  command "mysqladmin -u root password \"#{node['orchestrator']['root_db_pass']}\""
  retries 5
  only_if "mysql -u root -e 'show databases'"
  not_if { node['orchestrator']['root_db_pass'] == '' }
  subscribes :start, 'service[mysql]'
end

gem_package 'mysql2' do
  options '-- --with-mysql-dir=/usr' # if node['platform_family'] == 'rhel'
end

# for the database cookbook
chef_gem 'mysql2'

service 'mysql' do
  action [:enable, :start]
end

mysql_connection_info = {
  host: 'localhost',
  port: 3306,
  username: 'root',
  password: node['orchestrator']['root_db_pass']
}

mysql_database 'orchestrator' do
  connection mysql_connection_info
  action :create
end

mysql_database_user node['orchestrator']['config']['MySQLOrchestratorUser'] do
  connection mysql_connection_info
  password node['orchestrator']['config']['MySQLOrchestratorPassword']
  host 'localhost'
  database_name 'orchestrator'
  privileges [:all]
  action :grant
end
