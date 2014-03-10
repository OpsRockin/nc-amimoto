require ::File.expand_path('../../spec_helper', __FILE__)


describe service('memcached') do
  it { should be_enabled }
  it { should be_running }
end
