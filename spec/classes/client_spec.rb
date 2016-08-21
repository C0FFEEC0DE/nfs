# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require_relative '../spec_helper'

describe 'nfs::client' do
  it { should compile }
  it { should compile.with_all_deps }
  it { should contain_class('nfs::client::packages')}
  it { should contain_class('nfs::client::configure')}
end
