class profile::linuxad {
  include stdlib
  include samba
  include ssh
  include resolv_conf
  #include sudo
  #include sudo::configs
}
