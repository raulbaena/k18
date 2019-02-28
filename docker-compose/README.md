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

#Afegim un altre servei al docker compose, hem afegit el servei portainer
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
  portainer:
    image: portainer/portainer
    ports:
      - "9000:9000" #Primer es el port del host y despres el del container
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock" #Es defineix un volum podem montar part del disc dur del pc al docker
        #Estem fent un bin mount, es que quin directori del pc ha de montar a quin direcotri del container
        #Named volume
    networks:
      - mynet   
networks:
 mynet:
```

#Exemple de execucuio del portainer

```
[isx53320159@i12 docker-compose]$ docker-compose up -d
Creating network "dockercompose_mynet" with the default driver
Creating dockercompose_portainer_1 ... 
Creating dockercompose_sshd_1 ... 
Creating dockercompose_kserver_1 ... 
Creating dockercompose_portainer_1
Creating dockercompose_sshd_1
Creating dockercompose_portainer_1 ... done
[isx53320159@i12 docker-compose]$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS                    NAMES
37d0aa7594b6        raulbaena/k18:kserver   "/opt/docker/start..."   3 seconds ago       Up 3 seconds                                 dockercompose_kserver_1
e4a1920aa5b0        portainer/portainer     "/portainer"             3 seconds ago       Up 3 seconds        0.0.0.0:9000->9000/tcp   dockercompose_portainer_1
cb506594a4f1        raulbaena/k18:sshd      "/opt/docker/start..."   3 seconds ago       Up 3 seconds                                 dockercompose_sshd_1
```

##Entrem amb el navegador a locahost:9000 y veurem else stack que tenim
```
Poner imagen
```

#Named volume

```
version: "2"
services:
  kserver:
    image: raulbaena/k18:kserver
    volumes: 
      - "krb5data:/var/kerberos" #Creem un volum on es guardaran les coses del docker
    networks:
      - mynet
  sshd:
    image: raulbaena/k18:sshd
    networks:
      - mynet     
  portainer:
    image: portainer/portainer
    ports:
      - "9000:9000"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    networks:
      - mynet   
networks:
 mynet:
volumes: 
 krb5data: #Declarem el volum al final del fitxer
```






