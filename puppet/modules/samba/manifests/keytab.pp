class samba::keytab inherits samba {
  exec { 'Create keytab file':
    path    => '/usr/bin',
    command => "net ads keytab create -U $join_user%$join_user_pw",
    unless => "getent passwd $join_user 2>/dev/null",
  }
}
