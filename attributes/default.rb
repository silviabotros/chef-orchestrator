include_attribute 'percona'
default['percona']['skip_configure'] = true
default['percona']['skip_passwords'] = true
default['orchestrator']['root_db_pass'] = 'fakerootpass'
default['orchestrator']['remote_user'] = 'orchestrator'
default['orchestrator']['remote_pass'] = 'fakepass'
default['orchestrator']['orchestrator_db_user'] = 'orchestrator'
default['orchestrator']['orchestrator_db_pass'] = 'fakerpass'
default['orchestrator']['discover_slave_hosts'] = true
default['orchestrator']['poll_sec'] = 60
default['orchestrator']['forget_instances_hrs'] = 240
default['orchestrator']['reasonable_repl'] = 10
default['orchestrator']['maintenance_lag_secs'] = 20
default['orchestrator']['audit_page_size'] = 20
default['orchestrator']['slave_start_post_wait'] = 1000
default['orchestrator']['http_auth_user'] = ''
default['orchestrator']['http_auth_pass'] = ''
