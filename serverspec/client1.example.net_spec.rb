# For serverspec documentation - see http://serverspec.org/tutorial.html

describe 'nfs-kernel-server' do
  describe package('nfs-kernel-server') do
    it { should be_installed }
  end

  describe service('nfs-kernel-server') do
    it { should be_running }
  end

  describe file('/vol1') do
    it { should be_directory }
  end

  describe file('/vol2') do
    it { should be_directory }
  end

  describe file('/etc/exports') do
  it { should contain '/vol1 192.168.50.0/24(rw,sync,no_root_squash)' }
  it { should contain '/vol2 192.168.50.0/24(rw,sync,no_root_squash)' }
  end

  describe file('/etc/exports.d/vol1') do
  it { should contain '/vol1 192.168.50.0/24(rw,sync,no_root_squash)' }
  end

  describe file('/etc/exports.d/vol2') do
  it { should contain '/vol2 192.168.50.0/24(rw,sync,no_root_squash)' }
  end

  describe command('echo "123" > /vol1/testdata') do
  its(:exit_status) { should eq 0 }
  end

  describe command('echo "123" > /vol2/testdata') do
  its(:exit_status) { should eq 0 }
  end

end
