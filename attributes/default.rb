# Percona
include_attribute 'percona'
default['percona']['skip_configure'] = true
default['percona']['skip_passwords'] = true

# Orchestrator
default['orchestrator']['path'] = '/usr/local/orchestrator'
default['orchestrator']['config']['AuditPageSize'] = 20
default['orchestrator']['config']['AuthenticationMethod'] = 'Basic'
default['orchestrator']['config']['DiscoverByShowSlaveHosts'] = true
default['orchestrator']['config']['HTTPAuthPassword'] = 'secret'
default['orchestrator']['config']['HTTPAuthUser'] = 'admin'
default['orchestrator']['config']['HostnameResolveMethod'] = '@@hostname'
default['orchestrator']['config']['InstancePollSeconds'] = 60
default['orchestrator']['config']['ListenAddress'] = ':3000'
default['orchestrator']['config']['MySQLOrchestratorDatabase'] = 'orchestrator'
default['orchestrator']['config']['MySQLOrchestratorPassword'] = 'fakerpass'
default['orchestrator']['config']['MySQLOrchestratorUser'] = 'orchestrator'
default['orchestrator']['config']['MySQLTopologyPassword'] = 'fakepass'
default['orchestrator']['config']['MySQLTopologyUser'] = 'orchestrator'
default['orchestrator']['config']['ReadOnly'] = true
default['orchestrator']['config']['ReasonableMaintenanceReplicationLagSeconds'] = 20
default['orchestrator']['config']['ReasonableReplicationLagSeconds'] = 10
default['orchestrator']['config']['SlaveStartPostWaitMilliseconds'] = 1000
default['orchestrator']['config']['UnseenInstanceForgetHours'] = 240
default['orchestrator']['package']['version'] = '2.1.5-1'
default['orchestrator']['root_db_pass'] = ''
