require_relative '../spec_helper'

describe 'nfs::mount' do
  let(:title) { '/vol1' }
  let(:params) {{
    :mountpoint => '/vol1',
    :server => '192.168.50.4',
    :share => '/vol1'
    }}

  it { should contain_class("nfs::client")}
end
