class profile::linuxad {
  include stdlib
  include smartcard
  include ssh
  #include sudo
  #include sudo::configs
}
