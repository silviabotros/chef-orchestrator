# require 'minitest/spec'
# require 'chef/mixin/shell_out'
#
# Cookbook Name:: orchestrator
# Spec:: default
#

# describe_recipe 'orchestrator::default' do
#   include Chef::Mixin::ShellOut
#   include Minitest::Chef::Assertions
#   include Minitest::Chef::Context
#   include Minitest::Chef::Resources

#   describe 'runs orchestrator' do
#     it 'is running mysql' do
#       service('mysql').must_be_running
#     end
#     it 'has an orchestrator db' do
#       assert_sh('mysql -e "show databases" | grep orchestrator')
#     end
#     it 'has an orchestrator user' do
#       assert_sh('mysql -e "select user from mysql.user" | grep orchestrator')
#     end
#     it 'installs orchestrator' do
#       skip if node['orchestrator']['cli_only']
#       package('orchestrator').must_be_installed
#     end
#     it 'installs just the CLI package' do
#       skip unless node['orchestrator']['cli_only']
#       package('orchestrator-cli').must_be_installed
#     end
#     it 'creates the cfg file' do
#       file('/etc/orchestrator.conf.json').must_exist
#     end
#     it 'removes the packaged cfg file' do
#       file('/usr/local/orchestrator/conf/orchestrator.conf.json').wont_exist
#     end
#     it 'has a process named orchestrator running' do
#       assert_sh('ps aux | grep orchestrator | grep -v grep')
#     end
#   end
# end
