require ::File.expand_path('../../spec_helper', __FILE__)

%w{ memcached zip unzip wget iptables git }.each do | pkg |
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file('/etc/my.cnf') do
  it { should be_file }
  it { should contain /^\s*innodb_buffer_pool_size\s*=\s*64M/ }
end
