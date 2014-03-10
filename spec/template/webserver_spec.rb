require ::File.expand_path('../../spec_helper', __FILE__)

describe service('httpd') do
  it { should_not be_enabled }
  it { should_not be_running }
end

%w(nginx php-fpm).each do |service|
  describe service(service) do
    it { should be_enabled }
    it { should be_running }
    it { should be_monitored_by('monit') }
  end
end

describe command('nginx -t') do
  it { should return_exit_status 0 }
end

describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
  it { should contain /^\s*worker_processes\s*2/ }
end

describe file("/var/www/vhosts/default") do
  it { should be_directory }
end

