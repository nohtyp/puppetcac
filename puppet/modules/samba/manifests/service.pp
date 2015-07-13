class samba::service inherits samba {
  service { 'Samba-Winbind':
    ensure      => 'running',
    name        => 'winbind',
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
    subscribe   => [ File_line['AD samba kerberos secrets and keytab'], File_line['AD samba kerberos refresh tickets']],
  }
  service { 'Samba-SMB':
    ensure      => 'running',
    name        => 'smb',
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
    subscribe   => [ File_line['AD samba kerberos secrets and keytab'], File_line['AD samba kerberos refresh tickets']],
  }
}
