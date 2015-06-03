class samba::authconfig inherits samba {
  exec { 'authconfig':
      path    => '/usr/sbin:/bin:/usr/bin',
      command => "authconfig --disablecache --enablewinbind --enablewinbindauth --smbsecurity=ads \
      --smbworkgroup=$smbworkgroup --smbrealm=$realm   --enablewinbindusedefaultdomain \
      --smbservers='$active_directory_servers' --winbindtemplatehomedir=$home --winbindtemplateshell=$default_shell \
      --enablekrb5 --krb5realm=$realm --krb5kdc=$krb5kdc  --krb5adminserver=$krb5adminserver \
      --enablekrb5kdcdns --enablekrb5realmdns --enablelocauthorize --enablemkhomedir --enablepamaccess --updateall",
      unless  => "grep $join_user /tmp/adjoined",
  }
}

