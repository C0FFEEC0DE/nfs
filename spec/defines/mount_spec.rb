require_relative '../spec_helper'

describe 'nfs::mount' do
  let(:title) { '/vol1' }
  let(:params) {{
    :mountpoint => '/vol1',
    :server     => '192.168.50.4',
    :share      => '/vol1',
    :ensure     => 'present'
    }}

  it { should compile }
  it { should compile.with_all_deps }
  it { should contain_class("nfs::client")}
  it { should contain_mount('/vol1').with_ensure('mounted')}

end
