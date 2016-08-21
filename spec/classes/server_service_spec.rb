# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require_relative '../spec_helper'

describe 'nfs::server::service' do
  it { should contain_service('nfs-kernel-server').with('ensure' => 'running')}
end
