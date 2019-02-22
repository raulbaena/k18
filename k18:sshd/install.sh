#! /bin/bash
groupadd local01
groupadd kusers
gropuadd -c users -g local01 local01
gropuadd -c users -g local01 local02
gropuadd -c users -g local01 local03
gropuadd -c users -g kusers  user01
gropuadd -c users -g kusers user02
gropuadd -c users -g kusers user03
echo "local01"| passwd --stdin local01
echo "local02"| passwd --stdin local02
echo "local03"| passwd --stdin local03
cp /opt/docker/sshd_config /etc/ssh/sshd_config
#cp /opt/docker/krb5.keytab /etc/krb5.keytab
/usr/bin/ssh-keygen -A
cp /opt/docker/krb5.conf /etc/krb5.conf 
kadmin -p pau -w kpau -q "ktadd /etc/krb5.keytab host/ksshd.edt.org" #exportar les claus
