class smartcard::params {
  
  case $::osfamily {
    'RedHat': {
      $packages = [ 'coolkey', 'esc', 'pam_pkcs11', 'pcsc-lite-ccid', 'nss-tools', 'krb5-libs', 'krb5-pkinit',
                    'authconfig', 'krb5-workstation', 'pam_krb5', 'oddjob-mkhomedir', 'ntp',
                    'samba-winbind-krb5-locator', 'authconfig-gtk','sssd', 'sssd-tools',
                    'sssd-ad', 'samba-client', 'samba-common', 'cifs-utils'
      ]
    }
    default: {
      fail("This ${module_name} module is not supported on a ${::osfamily} based system.")
    }
  }
}
