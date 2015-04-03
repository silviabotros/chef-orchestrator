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

include_recipe 'percona::server'
include_recipe 'percona::client'

execute 'set root pass' do
  command "mysqladmin -u root password \"#{node['orchestrator']['root_db_pass']}\""
  retries 5
  only_if "mysql -u root -e 'show databases'"
  not_if { node['orchestrator']['root_db_pass'] == '' }
  subscribes :start, 'service[mysql]'
end

gem_package 'mysql'

service 'mysql' do
  action [:enable, :start]
end

include_recipe 'database'
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

mysql_database_user node['orchestrator']['orchestrator_db_user']  do
  connection mysql_connection_info
  password node['orchestrator']['orchestrator_db_pass']
  host 'localhost'
  database_name 'orchestrator'
  privileges [:all]
  action :grant
end
