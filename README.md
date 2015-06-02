# puppetcac
This module will configure (initially CentOS 7) systems for cac logins.  This repo is a work in progress, I am gathering all of the
packages that are needed to get cac login working with (Redhat family OS).

Check back later to see if module is finished.

Current setup:

If you run this in vagrant and use the following commands then you should be able to pass kerberos authentication between systems (SSO ssh).

[Configure authconfig for system]
authconfig  --disablecache --enablewinbind --enablewinbindauth --smbsecurity=ads --smbworkgroup=<Workgroup name> --smbrealm=<Domain name in all capitals> --enablewinbindusedefaultdomain --smbservers=<fqdn of active directory server> --winbindtemplatehomedir=/home/%D/%U --winbindtemplateshell=/bin/bash --enablekrb5 --krb5realm=<Domain name in all capitals> --krb5kdc=<fqdn of active directory server>  --krb5adminserver=<fqdn of active directory server> --enablekrb5kdcdns --enablekrb5realmdns --enablelocauthorize --enablemkhomedir --enablepamaccess --updateall

[Join system to Active Directory]
net ads join <domain> -U <user account>

[Create keytab for kerberos]
net ads keytab create -U <user account>

[Change kerberos method /etc/samba/smb.conf]
kerberos method = secrets and keytab
winbind refresh tickets = yes

[To change to password only for ssh]
GSSAPIAuthentication no           
GSSAPICleanupCredentials no       
GSSAPIKeyExchange no
PasswordAuthentication yes
