require 'spec_helper'
describe 'orchestrator::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
  before do
    stub_command("rpm -qa | grep Percona-Server-shared-56").and_return(true)
    stub_command("mysql -u root -e 'show databases'").and_return(true) 
    stub_command("rpm -qa | grep orchestrator-1.0-1").and_return(true)
    stub_command("ps aux | grep orchestrator | grep -v grep").and_return(true)
  end
  it 'creates config file' do
    expect(chef_run).to create_template('/etc/orchestrator.conf.json')
  end
  it "removes the built in config file" do
    expect(chef_run).to delete_file('/usr/local/orchestrator/conf/orchestrator.conf.json')
  end
  it 'has an orchestrator process running' do
    stub_command("ps aux | grep orchestrator | grep -v grep")
    expect(chef_run).to run_execute('cd /usr/local/orchestrator && ./orchestrator http > /var/log/orchestrator.log 2>&1 &')
  end

  it 'install from rpm' do
    stub_command('rpm qa | grep orchestrator')
    expect(chef_run).to_not run_execute('sudo rpm -i https://github.com/outbrain/orchestrator/releases/download/v1.0/orchestrator-1.0-1.x86_64.rpm')
  end
end
