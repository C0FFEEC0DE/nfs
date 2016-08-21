require_relative '../spec_helper'

describe 'nfs::export' do
  let(:title) { '/vol1' }
  let(:params) {{
    :path => '/vol1',
    :acl => '192.168.50.0/24',
    :options => 'rw,sync,no_root_squash'
    }}

  it { should contain_class("nfs::server")}
  it { should contain_file("/vol1").with_ensure("directory")}
#  it { should contain_file("/etc/exports.d/vol1")}
#    .with_ensure("directory")
#    .with_content("/vol1 192.168.50.0/24(rw,sync,no_root_squash)")}
end
