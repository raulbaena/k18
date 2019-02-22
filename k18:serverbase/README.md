#### Kerberos Server
# @edt Sergi Muñoz Carmona ASIX M06 2018-2019
```
  kadmin.local -q "list_principals"
   28  kadmin.local 
   29  /usr/sbin/krb5kdc 
   30  /usr/sbin/kadmind
   31  dnf -y install procps
   32  kinit pere
   33  vi /etc/krb5.conf
   34  kinit pere
   35  klist
   36  kdestroy
   37  klist
   38  kinit superuser
   39  klist
   40  kdestroy
   41  kinit pere/admin
   42  kinit pere
   43  klist
   44  kadmin
   45  kinit anna
   46  klist
   47  kadmin
   48  kadmin -p superuser
   49  klist
   50  kadmin -p pere
   51  history
```
