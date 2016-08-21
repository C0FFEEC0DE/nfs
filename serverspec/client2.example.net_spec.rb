# For serverspec documentation - see http://serverspec.org/tutorial.html

describe 'nfs-common' do

  describe package('nfs-common') do
    it { should be_installed }
  end

  describe file('/vol1') do
  it { should be_mounted.with( :type => 'nfs' ) }
  end

  describe file('/vol2') do
  it { should be_mounted.with( :type => 'nfs' ) }
  end

end
