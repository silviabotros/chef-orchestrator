require 'spec_helper'

describe 'orchestrator::_database_setup' do
  let (:chef_run) {
    ChefSpec::Runner.new do |node|
      node.set['orchestrator']['root_db_pass'] = 'fakepass'
    end.converge(described_recipe)
  }
  before do
    stub_command("rpm -qa | grep Percona-Server-shared-56").and_return(true)
    stub_command("mysql -u root -e 'show databases'").and_return(true)
  end
  it 'installs mysql gem' do
    expect(chef_run).to install_gem_package('mysql')
  end
  it 'has mysql and it is running' do
    expect(chef_run).to enable_service('mysql')
    expect(chef_run).to start_service('mysql')
  end
  it 'doesnt make orchestrator db if it finds it' do
    stub_command("mysql -e 'show databases' | grep orchestrator").and_return(true)
    expect(chef_run).to_not create_database('orchestrator')
  end
  it 'makes orchestrator if it is not found' do
    stub_command("mysql -e 'show databases' | grep orchestrator").and_return(false)
    expect(chef_run).to run_execute('create database orchestrator')
  end
  it 'created orchestrator user' do
    stub_command("mysql -e 'select user from mysql.users' | grep orchestrator").and_return(false)
    expect(chef_run).to grant_database_user('orchestrator')
  end
  it 'sets the root pass' do
    stub_command("mysql -u root -pfakepass")
    expect(chef_run).to run_execute("set root pass")
  end
end
