
control 'mysql is running' do
  describe service('mysql') do
    it { should be_running }
  end
end

sql = mysql_session('root', 'snakeoil')

control 'database exists' do
  describe sql.query('show databases like \'orchestrator\';') do
    its('stdout') { should match(/orchestrator/) }
  end
end

control 'database user' do
  describe sql.query('select user from mysql.user;') do
    its('stdout') { should match(/orchestrator/) }
  end
end
