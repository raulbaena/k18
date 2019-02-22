#! /bin/bash
# @edt ASIX M06 2018-2019
# instal.lacio
#  - crear usuaris locals
# -------------------------------------

cp /opt/docker/krb5.conf /etc/krb5.conf
cp /opt/docker/kdc.conf /var/kerberos/krb5kdc/kdc.conf
cp /opt/docker/kadm5.conf /var/kerberos/kadm5.conf

#BASE DE DADES
echo -e "masterkey\nmasterkey" |/usr/sbin/kdb5_util create -s	
#PRINCIPALS
echo -e "kpere\nkpere" | kadmin.local -q "addprinc pere"
echo -e "kanna\nkanna" | kadmin.local -q "addprinc anna"
echo -e "kmarta\nkmarta" | kadmin.local -q "addprinc marta"
echo -e "kjordi\nkjordi" | kadmin.local -q "addprinc jordi"
echo -e "kpau\nkpau" | kadmin.local -q "addprinc pau"
echo -e "kpere\nkpere" | kadmin.local -q "addprinc pere/admin"
echo -e "kjulia\nkjulia" | kadmin.local -q "addprinc julia"
echo -e "ksuperuser\nksuperuser" | kadmin.local -q "addprinc superuser"


