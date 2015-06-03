class samba::join inherits samba {

  exec { 'Join active directory':
   path    => '/usr/bin',
   command => "net ads join $mydomain -U $join_user%$join_user_pw",
   unless  => "wbinfo -u 2>/dev/null|grep -c $join_user",
  }
}
