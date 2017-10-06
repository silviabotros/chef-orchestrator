
control 'orchestrator' do
  describe package('orchestrator') do
    it { should be_installed }
  end
end

control 'orchestator config' do
  describe file '/etc/orchestrator.conf.json' do
    it { should be_file }
    its(:owner) { should eq 'root' }
    its(:group) { should eq 'root' }
  end

  describe json('/etc/orchestrator.conf.json') do
    its(['DiscoverByShowSlaveHosts']) { should eq true }
    its(['HTTPAuthPassword']) { should eq 'secret' }
    its(['HTTPAuthUser']) { should eq 'admin' }
    its(['HostnameResolveMethod']) { should eq '@@hostname' }
    its(['InstancePollSeconds']) { should eq 60 }
    its(['ListenAddress']) { should eq ':3000' }
    its(['MySQLOrchestratorDatabase']) { should eq 'orchestrator' }
    its(['MySQLOrchestratorPassword']) { should eq 'fakerpass' }
    its(['MySQLOrchestratorUser']) { should eq 'orchestrator' }
    its(['MySQLTopologyPassword']) { should eq 'fakepass' }
    its(['MySQLTopologyUser']) { should eq 'orchestrator' }
    its(['ReadOnly']) { should eq true }
    its(['ReasonableMaintenanceReplicationLagSeconds']) { should eq 20 }
    its(['ReasonableReplicationLagSeconds']) { should eq 10 }
    its(['SlaveStartPostWaitMilliseconds']) { should eq 1000 }
    its(['UnseenInstanceForgetHours']) { should eq 240 }
    its(['AuditPageSize']) { should eq 20 }
    its(['AuthenticationMethod']) { should eq 'Basic' }
  end

  describe service('orchestrator') do
    it { should be_running }
  end
end
