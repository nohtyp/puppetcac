require 'spec_helper'

describe 'samba::server::config', :type => :class do

  context "on an unsupported OS" do
    let :facts do { :osfamily => 'Solaris' } end
#     it { should raise_error(/samba::server is incompatible with this osfamily/) }
  end

  context "on a Debian OS" do
    let :facts do
      {
        :osfamily               => 'Debian',
        :operatingsystemrelease => '6',
        :concat_basedir         => '/dne',
      }
    end

#     it { should contain_file('/etc/bind/').with_owner('bind') }
  end

end

