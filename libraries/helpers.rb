
def is_centos?
  node['platform'] == 'centos' ? true : false
end

def is_cent6?
  true if is_centos? && node['platform_version'].to_i == 6
  false
end

def is_cent7?
  true if is_centos? && node['platform_version'].to_i == 7
  false
end

