class smartcard::install inherits smartcard {
  
  package { $packages:
    ensure =>  installed,
  }
}
