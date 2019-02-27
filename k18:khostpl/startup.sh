#! /bin/bash
# @edt ASIX M06 2018-2019
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Dades instalades"
/usr/sbin/nslcd && echo "nslcd Ok"
/usr/sbin/nscd && echo "nscd Ok"
/bin/bash


