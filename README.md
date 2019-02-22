Kerberos @edt AISX m06 2018-2019

Arquitectura

Khost: client de kerberos

Kserver: servidor amb kerberos

docker run --rm --name kserver.edt.org -h kserver.edt.org --network mynet -d k18:kserver

#Kerberos application server pagina 21 manual

#Servidor ssh cambis
Autenticacio proviDer: /etc/passwd, ldap, kerberos (Tambe son information providers per força a de anar associat en un identity provider)
Identity Provider: /ect/passwd, ldap

# Crear usuaris locals a kerberos
user01|
user02|--> Usuaris principals de kerberos
user03|

#Creem una maquina ssh
Crearem usuaris locals que seran IP y AP
Crearem usuaris locals que seran IP (Users01,user02,user03)
Crearem usuaris locals que seran IP ldap y AP kerberos


#Exeguem la maquina sshd y de kerberos en segon pla
docker run --rm --name kserver.edt.org -h kserver.edt.org --network mynet -d k18:server
docker run --rm --name ksshd.edt.org -h ksshd.edt.org --network mynet -d k18:sshd

#Pagina 22 del manual ssh kerberitzat
#Primer pas instalat kworkstation
#Segon el arxiu krb5.conf
#Un servidor kerberitzat ha de tenir ell una entrada de principal a kerberos, dintre de kerberos ha de haver-hi principal de kerberos
Les maquines han de tenir el seu compte kerberos.
#Ens conectem com un usuari administrador a kerberos desde la maquina ssh
 kadmin -p pau
#Creem dos usuaris 
 addprinc -randkey host/sshd
 addprinc -randkey host/jsshd.edt.org
 /etc/krb5.keytab.
ktadd -k /etc/krb5.keytab host/ksshd.edt.org --> Afegim el principal que volem

#Afegim suuaris a kerberos
addprinc -pw kuser01 user01
addprinc -pw kuser02 user02
addprinc -pw kuser03 user03

#Editem l'arxiu sshd_config y descomentem aquestes lineas
KerberosAuthentication yes
#KerberosOrLocalPasswd yes
KerberosTicketCleanup yes
#KerberosGetAFSToken no
KerberosUseKuserok yes

Crear la clau en el servidor y tenirla en el ssh
bash: /usr/bin/sshd: No such file or directory
[root@ksshd docker]# kinit pere
Password for pere@EDT.ORG: 
[root@ksshd docker]# klist
Ticket cache: FILE:/tmp/krb5cc_0
Default principal: pere@EDT.ORG

Valid starting     Expires            Service principal
02/22/19 10:44:13  02/23/19 10:44:13  krbtgt/EDT.ORG@EDT.ORG
[root@ksshd docker]# kinit user01
Password for user01@EDT.ORG: 
[root@ksshd docker]# klist
Ticket cache: FILE:/tmp/krb5cc_0
Default principal: user01@EDT.ORG

Valid starting     Expires            Service principal
02/22/19 10:44:29  02/23/19 10:44:29  krbtgt/EDT.ORG@EDT.ORG
[root@ksshd docker]# destroy
bash: destroy: command not found
[root@ksshd docker]# kdestroy
[root@ksshd docker]# ssh local01@localhost
The authenticity of host 'localhost (::1)' can't be established.
ECDSA key fingerprint is SHA256:yGZcuJMzW1vPhWjeN1ZvvTV1QwJwI6Taa8RQbUx1ZTw.
ECDSA key fingerprint is MD5:a7:45:52:d6:a4:ee:60:9a:24:fb:e2:80:62:fb:19:c6.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'localhost' (ECDSA) to the list of known hosts.
local01@localhost's password: 
[local01@ksshd ~]$ logout
Connection to localhost closed.
[root@ksshd docker]# ssh user01@localhost
user01@localhost's password: 
Permission denied, please try again.
user01@localhost's password: 
Last failed login: Fri Feb 22 10:45:28 UTC 2019 from ::1 on ssh:notty
There was 1 failed login attempt since the last successful login.



klist -k krb5.keytab --> llistar un  fitxer de claus
