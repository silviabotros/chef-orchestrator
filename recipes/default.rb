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


packagecloud_repo "github/orchestrator"

include_recipe 'orchestrator::_package'

chef_gem 'json'

ruby_block 'create the config file from hash' do
  block do
    File.open("/etc/orchestrator.conf.json", "w") do |f|
      f.write(JSON.pretty_generate(node['orchestrator']['config']))
    end
  end
end

file '/usr/local/orchestrator/conf/orchestrator.conf.json' do
  action :delete
end

service 'orchestrator' do
  action :start
end
