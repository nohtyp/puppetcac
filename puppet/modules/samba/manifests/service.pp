class samba::service inherits samba {
  service { 'Samba-Services':
    ensure      => 'running',
    name        => $samba_services,
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
    subscribe   => [ File_line['AD samba kerberos secrets and keytab'], File_line['AD samba kerberos refresh tickets']],
  }
}
