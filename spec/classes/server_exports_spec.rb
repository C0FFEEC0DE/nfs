# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require_relative '../spec_helper'

describe 'nfs::server::exports' do
  it { should compile }
  it { should compile.with_all_deps }
end
