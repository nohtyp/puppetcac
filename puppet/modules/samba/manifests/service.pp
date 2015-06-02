class samba::service inherits samba {
  service { 'Samba-Winbind':
    ensure    => 'running',
    enable    => true,
    hastatus  => true,
    harestart => true,
    subscribe => File['/etc/samba/smb.conf'],
  }
}
