require 'spec_helper'

describe 'orchestrator::_database_setup' do
  let (:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['orchestrator']['root_db_pass'] = 'fakepass'
    end.converge(described_recipe)
  end
  before do
    stub_command('rpm -qa | grep Percona-Server-shared-56').and_return(true)
    stub_command("mysql -u root -e 'show databases'").and_return(true)
  end
  it 'installs mysql gem' do
    expect(chef_run).to install_gem_package('mysql')
  end
  it 'has mysql and it is running' do
    expect(chef_run).to enable_service('mysql')
    expect(chef_run).to start_service('mysql')
  end
  it 'makes the orchestrator db when needed' do
    stub_command("mysql -e 'show databases' | grep orchestrator").and_return(false)
    expect(chef_run).to create_mysql_database('orchestrator')
  end
  it 'creates orchestrator user' do
    stub_command("mysql -e 'select user from mysql.users' | grep orchestrator").and_return(false)
    expect(chef_run).to grant_mysql_database_user('orchestrator')
  end
  it 'sets the root pass' do
    stub_command('mysql -u root -pfakepass')
    expect(chef_run).to run_execute('set root pass')
  end
end
