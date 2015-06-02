class samba::params {
  
  $realm                        = 'FAMILYGUY.LOCAL'
  $workgroup                    = 'FAMILYGUY'
  $active_directory_servers     = 'familyguyserver.familyguy.local'
  $home                         = "/home/%D/%U"
  $default_shell                = '/bin/bash'
  $krb5kdc                      = 'familyguyserver.familyguy.local'
  $krb5adminserver              = 'familyguyserver.familyguy.local'
  $smbworkgroup                 = 'FAMILYGUY'
  $join_user                    = 'test'
  $join_user_pw                 = '!QAZXCDe3#'
  $mydomain                     = 'familyguy.local'

  
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease 
       { 
        '7' : {
          $packages = [ 'coolkey', 'esc', 'pam_pkcs11', 'pcsc-lite-ccid', 'nss-tools', 'krb5-libs', 'krb5-pkinit',
                    'authconfig', 'pam_krb5', 'ntp', 'samba-winbind-krb5-locator', 'sssd', 'sssd-tools',
                    'sssd-ad', 'samba-client', 'cifs-utils', 'oddjob-mkhomedir', 'krb5-workstation', 'samba-common',
                    'realmd', 'samba', 'samba-winbind-clients']
        }
       }
    }
    default: {
      fail("This ${module_name} module is not supported on a ${::osfamily} based system.")
    }
  }
}
