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

include_recipe 'orchestrator::_database_setup'

local_rpm = nil

if centos? && !node['orchestrator']['package']['url'].nil?
  local_rpm = File.join(Chef::Config['file_cache_path'], 'orchestrator.rpm')
  remote_file local_rpm do
    source node['orchestrator']['package']['url']
    checksum node['orchestrator']['package']['checksum']
    action :create_if_missing if node['orchestrator']['package']['checksum'].nil?
    notifies :install, 'package[orchestrator]', :immediately
  end
end

package 'orchestrator' do
  source local_rpm if centos? && !local_rpm.nil?
  version node['orchestrator']['package']['version'] if centos? && !node['orchestrator']['package']['version'].nil?
  action node['orchestrator']['package']['version'].nil? ? :upgrade : :install
end
