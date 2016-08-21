# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require_relative '../spec_helper'

describe 'nfs::client::packages' do
  it { should contain_package('nfs-common')}
end
