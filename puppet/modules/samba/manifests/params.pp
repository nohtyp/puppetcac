class samba::params {
  
  $realm                        = 'HQ.NESDIS.NOAA.DOC'
  $workgroup                    = 'HQ'
  $active_directory_servers     = 'hq-vtl-dc.hq.nesdis.noaa.doc'
  $home                         = "/home/%D/%U"
  $default_shell                = '/bin/bash'
  $krb5kdc                      = 'hq-vtl-dc.hq.nesdis.noaa.doc'
  $krb5adminserver              = 'hq-vtl-dc.hq.nesdis.noaa.doc'
  $smbworkgroup                 = 'HQ'
  $join_user                    = 'aduser'
  $join_user_pw                 = '@ct1v3D1reCt0ryU5er13!'
  $mydomain                     = 'hq.nesdis.noaa.doc'
  $ou                           = 'hq_nsof_vtl/vtl_admins_vms/linux'

  
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease 
       { 
        '6' : {
          $packages = [ 'nss-tools', 'esc', 'krb5-libs', 'krb5-workstation', 'pam_krb5', 'authconfig', 'sssd', 'sssd-tools',
                    'ccid', 'krb5-pkinit-openssl', 'oddjob-mkhomedir', 'sssd-ad', 'samba-common', 'samba-client', 'cifs-utils',
                    'samba-winbind-krb5-locator', 'samba-winbind-clients']
          $samba_services = [ 'winbind' ]
        }

        '7' : {
          $packages = [ 'coolkey', 'esc', 'pam_pkcs11', 'pcsc-lite-ccid', 'nss-tools', 'krb5-libs', 'krb5-pkinit',
                    'authconfig', 'pam_krb5', 'ntp', 'samba-winbind-krb5-locator', 'sssd', 'sssd-tools',
                    'sssd-ad', 'samba-client', 'cifs-utils', 'oddjob-mkhomedir', 'krb5-workstation', 'samba-common',
                    'realmd', 'samba', 'samba-winbind-clients']
          $samba_services = [ 'winbind', 'smb' ]
        }
       }
    }
    default: {
      fail("This ${module_name} module is not supported on a ${::osfamily} based system.")
    }
  }
}
