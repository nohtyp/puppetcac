class profile::linuxad {
  include stdlib
  include smartcard
  include ssh
  include resolv_conf
  #include sudo
  #include sudo::configs
}
