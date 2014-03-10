require ::File.expand_path('../../spec_helper', __FILE__)

describe file('/etc/php-fpm.d/www.conf') do
  it { should be_file }
  it { should contain /^\s*pm.max_children\s*=\s5/ }
end

describe 'PHP config parameters' do
  context  php_config('default_mimetype') do
    its(:value) { should eq 'text/html' }
  end

  context php_config('upload_max_filesize') do
    its(:value) { should eq '4M' }
  end

  context php_config('post_max_size') do
    its(:value) { should eq '8M' }
  end
end
