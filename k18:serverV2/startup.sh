#! /bin/bash
# @edt ASIX M06 2018-2019
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Dades instalades"
/usr/sbin/krb5kdc && echo "krb5kdc Ok"
/usr/sbin/kadmind -nofork && echo "kadmind Ok"
/bin/bash


