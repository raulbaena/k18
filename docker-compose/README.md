#Creacio de "app" de docker compose

Primer hem d'instalar el paquet de docker compose

```
dnf -y install docker-compose

```

#Enxegar docker compose

```
[isx53320159@i12 docker-compose]$ docker-compose up -d
Creating network "dockercompose_mynet" with the default driver
Creating kserver.edt.org ... 
Creating sshd.edt.org ... 
Creating sshd.edt.org
Creating sshd.edt.org ... done
```
#Parar docker compose
```
[isx53320159@i12 docker-compose]$ docker-compose downS
topping kserver.edt.org ... done
Stopping sshd.edt.org    ... done
Removing kserver.edt.org ... done
Removing sshd.edt.org    ... done
Removing network dockercompose_mynet
```

#Quan tu enxegas un docker compose y aquestes maquines no tenen definides un nom de host o de container automaticament agafa el nom del directori on es troba el fitxer de execució

#En aquets exemple veiem que en el fitxer de creacio de compose les maquines no tenen nom de host ni de container

```
  version: "2"
services:
  kserver:
    image: raulbaena/k18:kserver
    networks:
      - mynet
  sshd:
    image: raulbaena/k18:sshd
    networks:
      - mynet        
networks:
 mynet:
```

#Executem el docker compose y automaticament se li asiganara un nom de container y de host als dockers creats

```
[isx53320159@i12 docker-compose]$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS               NAMES
ca3857f9f4bd        raulbaena/k18:kserver   "/opt/docker/start..."   30 seconds ago      Up 29 seconds                           dockercompose_kserver_1
6d231d0afd36        raulbaena/k18:sshd      "/opt/docker/start..."   30 seconds ago      Up 29 seconds                           dockercompose_sshd_1
```
