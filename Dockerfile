FROM centos:latest
RUN rpm -Uvh https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
RUN yum update -y && yum install wget java-1.8.0-openjdk unzip -y && yum install postgresql96 -y

ENV PATH /usr/pgsql-9.6/bin:$PATH

RUN mkdir /opt/pentaho
WORKDIR /opt/pentaho

# IF y have distributive archive IN folder "distr" use that TWO COMMAND
# RUN echo "Get Pentaho BA CE distributive from host docker folder (for fast start and debug)"
# COPY /distr/pentaho-server-ce-7.0.0.0-25.zip /opt/pentaho/

# IF you want download distrubutive from repo USE these TWO COMMMAND
RUN echo "Get Pentaho BA CE distributive from sourceforge"
RUN wget -O pentaho-server-ce-7.0.0.0-25.zip https://sourceforge.net/projects/pentaho/files/Business%20Intelligence%20Server/7.0/pentaho-server-ce-7.0.0.0-25.zip \
    --progress=bar:force

#RUN echo "Unzip downloded file"
RUN unzip -q pentaho-server-ce-7.0.0.0-25.zip 
RUN rm  pentaho-server-ce-7.0.0.0-25.zip  -f

WORKDIR /opt/pentaho/pentaho-server



