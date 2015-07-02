class samba::params {
  
  $realm                        = 'FAMILYGUY.LOCAL'
  #$realm                        = 'HQ.NESDIS.NOAA.DOC'
  $workgroup                    = 'FAMILYGUY'
  #$workgroup                    = 'HQ'
  $active_directory_servers     = 'familyguyserver.familyguy.local'
  #$active_directory_servers     = 'hq-vtl-dc.hq.nesdis.noaa.doc'
  $home                         = "/home/%D/%U"
  $default_shell                = '/bin/bash'
  $krb5kdc                      = 'familyguyserver.familyguy.local'
  #$krb5kdc                      = 'hq-vtl-dc.hq.nesdis.noaa.doc'
  $krb5adminserver              = 'familyguyserver.familyguy.local'
  #$krb5adminserver              = 'hq-vtl-dc.hq.nesdis.noaa.doc'
  $smbworkgroup                 = 'FAMILYGUY'
  #$smbworkgroup                 = 'HQ'
  $join_user                    = 'test'
  #$join_user                    = 'aduser'
  $join_user_pw                 = '!QAZXCDe3#'
  #$join_user_pw                 = '@ct1v3D1reCt0ryU5er13!'
  $mydomain                     = 'familyguy.local'
  #$mydomain                     = 'hq.nesdis.noaa.doc'
  $ou                           = 'Linux/test\ ou'

  
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
