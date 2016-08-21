# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require_relative '../spec_helper'

describe 'nfs::server' do
  it { should compile }
  it { should compile.with_all_deps }
  it { should contain_class('nfs::server::packages')}
  it { should contain_class('nfs::server::configure')}
  it { should contain_class('nfs::server::service')}
end
