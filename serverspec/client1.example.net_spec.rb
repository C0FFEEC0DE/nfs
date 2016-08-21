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
end
