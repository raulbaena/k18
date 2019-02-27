#KLOSTPL aixo servei per autenticacio pam kerberos y ldap

#Execucio server ldap
docker run --rm --name ldap.edt.org -h ldap.edt.org --net mynet -d raulbaena/k18:ldap

#Execicucio server kerberos
docker run --rm --name kserver.edt.org -h kserver.edt.org --network mynet -d raulbaena/k18:kserver

#Execucio client pam kerberos
docker run --rm --name khost.edt.org -h khost.edt.org --network mynet -it raulbaena/k18:khostpl

