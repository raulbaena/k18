#! /bin/bash
# @edt ASIX M06 2018-2019
# startup.sh
# -------------------------------------

/opt/docker/install.sh && echo "Dades instalades"
/usr/sbin/sshd -D 
#El servidor ssh es queda en bg
/bin/bash


