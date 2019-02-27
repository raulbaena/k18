# Servidor SSH amb connexio a kerberos
## @edt ASIX M11-SAD Curs 2018-2019

**raulbaena/k18:sshd** Servidor SSHD amb conexio amb kerberos. Servidor ssh que permet
  l'accés d'usuaris locals i usuaris locals amb kerberos.

Configuracio de servidor sshd:

 * instal·lar.hi el paquet krb5-workstation.

 * Copiar el fitxer krb5.conf ya configurat.

 * Hem de crear un principal per a que a l'hora de logarse un usuari kerberos pugui fer-ho sense l'utilitzacio de passwd.

 * Configuració de fitxer sshd_config. Hem descomentat les seguents lineas


```
# Kerberos options
KerberosAuthentication yes
KerberosTicketCleanup yes
```

Exemple de configutació

```
#       $OpenBSD: sshd_config,v 1.101 2017/03/14 07:19:07 djm Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/bin:/usr/bin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

# If you want to change the port on a SELinux system, you have to tell
# SELinux about this change.
# semanage port -a -t ssh_port_t -p tcp #PORTNUMBER
#
#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# System-wide Crypto policy:
# If this system is following system-wide crypto policy, the changes to
# Ciphers, MACs, KexAlgoritms and GSSAPIKexAlgorithsm will not have any
# effect here. They will be overridden by command-line options passed on
# the server start up.

```

Exemple del funcionament del servidor

```
[root@localhost k18:sshd]# ssh local01@172.18.0.4
local01@172.18.0.4's password: 
Last login: Wed Feb 27 13:18:02 2019 from 172.18.0.1
[local01@sshd ~]$ user01@sshd.edt.org
-bash: user01@sshd.edt.org: command not found
[local01@sshd ~]$ ssh user01@sshd.edt.org
user01@sshd.edt.org's password: 
Last login: Wed Feb 27 13:19:25 2019 from 172.18.0.4
[user01@sshd ~]$ kinit user02
Password for user02@EDT.ORG: 
[user01@sshd ~]$ klist
Ticket cache: FILE:/tmp/krb5cc_1003_6YVbVI3FBz
Default principal: user02@EDT.ORG

Valid starting     Expires            Service principal
02/27/19 14:19:48  02/28/19 14:19:48  krbtgt/EDT.ORG@EDT.ORG
[user01@sshd ~]$ ssh user02@sshd.edt.org
Last login: Wed Feb 27 13:19:59 2019 from 172.18.0.4
```

Com podem observar a l'hora de conectarnos com a "user02" no fa falta posar el passwd
ja que ha actuat el kerberos i ja tenia un access
