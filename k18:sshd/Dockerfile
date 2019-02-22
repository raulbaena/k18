# Version: 0.0.1
# @edt M06 2018-2019
# Client Kerberos
# -------------------------------------
FROM fedora:27
LABEL author="@edt Raul Baena ASIX M11-ASO"
LABEL description="Servidor ssh kerberitzat"
RUN dnf -y install openssh-server openssh-clients vim tree procps krb5-workstation passwd
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
