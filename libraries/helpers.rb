
def centos?
  node['platform'] == 'centos' ? true : false
end
