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

  describe command('echo "123" > /vol1/testdata1') do
  its(:exit_status) { should eq 0 }
  end

  describe command('echo "123" > /vol2/testdata1') do
  its(:exit_status) { should eq 0 }
  end

  describe file('/vol1/testdata') do
  it { should contain '123' }
  end

  describe file('/vol2/testdata') do
  it { should contain '123' }
  end

end
