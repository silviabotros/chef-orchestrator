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

include_recipe 'orchestrator::_package'

template '/etc/orchestrator.conf.json' do
  source 'orchestrator.json.conf.erb'
  variables(remote_user: node['orchestrator']['remote_user'],
            remote_pass: node['orchestrator']['remote_pass'],
            orchestrator_db_user: node['orchestrator']['orchestrator_db_user'],
            orchestrator_db_pass: node['orchestrator']['orchestrator_db_pass'],
            discover_slave_hosts: node['orchestrator']['discover_slave_hosts'],
            poll_sec: node['orchestrator']['poll_sec'],
            forget_instances_hrs: node['orchestrator']['forget_instances_hrs'],
            reasonable_repl: node['orchestrator']['reasonable_repl'],
            maintenance_lag_secs: node['orchestrator']['maintenance_lag_secs'],
            audit_page_size: node['orchestrator']['audit_page_size'],
            slave_start_post_wait: node['orchestrator']['slave_start_post_wait'],
            http_auth_method: node['orchestrator']['http_auth_method'],
            http_auth_user: node['orchestrator']['http_auth_user'],
            http_auth_pass: node['orchestrator']['http_auth_pass'],
            read_only: node['orchestrator']['read_only'],
            hostname_resolve_method: node['orchestrator']['hostname_resolve_method'])
end

file '/usr/local/orchestrator/conf/orchestrator.conf.json' do
  action :delete
end

service 'orchestrator' do
  action :start
end
