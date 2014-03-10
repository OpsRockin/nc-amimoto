ruby_block 'at_reboot' do
  block {
    reboot_line = '@reboot /usr/bin/curl https://raw.github.com/megumiteam/amimoto/master/initial.centos | /bin/bash'
    _file = Chef::Util::FileEdit.new('/etc/crontab')
    _file.insert_line_if_no_match(reboot_line,reboot_line)
    _file.write_file
  }
end
