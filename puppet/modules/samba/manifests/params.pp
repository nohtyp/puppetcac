class samba::params {
  
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease 
       { 
        '7' : {$packages = [ 'coolkey', 'esc', 'pam_pkcs11', 'pcsc-lite-ccid', 'nss-tools', 'krb5-libs', 'krb5-pkinit',
                    'authconfig', 'pam_krb5', 'ntp', 'samba-winbind-krb5-locator', 'sssd', 'sssd-tools',
                    'sssd-ad', 'samba-client', 'cifs-utils', 'oddjob-mkhomedir', 'krb5-workstation', 'samba-common',
                    'realmd', 'samba'
      ]
    }
       }
    }
    default: {
      fail("This ${module_name} module is not supported on a ${::osfamily} based system.")
    }
  }
}
