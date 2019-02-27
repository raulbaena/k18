docker run --rm --name khost -h khost --network mynet -it k18:khostp

KLOSTPL aixo servei per autenticacio pam kerberos y ldap:wq

#Execucio server ldap
docker run --rm --name ldap.edt.org -h ldap.edt.org --net mynet -d edtasixm06/ldapserver:18group

#Execicucio server kerberos
docker run --rm --name kserver.edt.org -h kserver.edt.org --network mynet -d raulbaena/k18:kserver
