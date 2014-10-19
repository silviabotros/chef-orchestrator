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

include_recipe "orchestrator::_database_setup"
case node['platform']
when "debian", "ubuntu"
  execute "download the .deb file" do
    command "wget -P /tmp https://github.com/outbrain/orchestrator/releases/download/v#{node['orchestrator']['package']['version']}/orchestrator_#{node['orchestrator']['package']['version']}_amd64.deb"
    action :run
  end
  execute "install from .deb" do
    command "dpkg -i orchestrator_#{node['orchestrator']['package']['version']}_amd64.deb "
    cwd "/tmp"
    action :run
    not_if "dpkg -l orchestrator"
  end
when "redhat", "centos", "fedora" 
  execute "install from rpm" do
    command "sudo rpm -i https://github.com/outbrain/orchestrator/releases/download/v#{node['orchestrator']['package']['version']}/orchestrator-#{node['orchestrator']['package']['version']}-1.x86_64.rpm"
    action :run
    not_if "rpm -qa | grep orchestrator-#{node['orchestrator']['package']['version']}-1"
  end
end

