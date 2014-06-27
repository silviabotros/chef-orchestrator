#
# Cookbook Name:: chef-orchestrator
# Recipe:: default
#
# Copyright (C) 2014 
#
# All rights reserved - Do Not Redistribute
#
include_recipe "orchestrator::_database_setup"
case node['platform']
  when "debian", "ubuntu"
    execute "download the .deb file" do
      command "wget -P /tmp https://github.com/outbrain/orchestrator/releases/download/v1.0/orchestrator_1.0_amd64.deb"
    end
    execute "install from .deb" do
      command "dpkg -i orchestrator_1.0_amd64.deb "
      cwd "/tmp"
      not_if "dpkg -l orchestrator"
    end
  when "redhat", "centos", "fedora" 
    execute "install from rpm" do
      command "sudo rpm -i https://github.com/outbrain/orchestrator/releases/download/v1.0/orchestrator-1.0-1.x86_64.rpm"
      not_if "rpm -qa | grep orchestrator-1.0-1"
    end
end

template "/etc/orchestrator.conf.json" do
  source 'orchestrator.json.conf.erb'
end

file "/usr/local/orchestrator/conf/orchestrator.conf.json" do
  action :delete
end

execute "start orchestrator" do
  command "cd /usr/local/orchestrator && ./orchestrator http > /var/log/orchestrator.log 2>&1 &"
  not_if "ps aux | grep orchestrator | grep -v grep"
end


