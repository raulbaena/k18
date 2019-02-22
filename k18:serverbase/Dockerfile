# Version: 0.0.1
# @edt M06 2018-2019
# kserver
# -------------------------------------
FROM fedora:27
LABEL author="@edt Sergi MC ASIX M11-ASO"
LABEL description="Dockerfile kserver base"
RUN dnf -y install krb5-server krb5-workstation krb5-libs procps vim tree
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
