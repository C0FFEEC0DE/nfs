# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require_relative '../spec_helper'

describe 'nfs::server::configure' do
  it { should contain_file("/etc/exports.d").with('ensure' => 'directory')}
  it { should contain_exec('update-etc-exports')
    .with_command("/bin/cat /etc/exports.d/* >/etc/exports")
    .with_notify("Service[nfs-kernel-server]")
    .with_refreshonly("true")}
end
