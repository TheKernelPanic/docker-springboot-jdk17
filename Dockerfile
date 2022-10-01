FROM debian:stable-slim

MAINTAINER "KernelPanic"

ENV JAVA_VERSION=17

RUN apt-get update && \
    apt-get install openjdk-$JAVA_VERSION-jdk openjdk-$JAVA_VERSION-jre supervisor -y && \
    adduser --disabled-password --gecos "" spring-application && \
    mkdir /var/log/springboot /usr/share/application

COPY springboot-supervisor.conf /etc/supervisor/conf.d/springboot.conf
COPY entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh

ENV JAVA_HOME=/usr/lib/jvm/java-1.$JAVA_VERSION.0-openjdk-amd64
ENV LOGS_DIRECTORY=/var/log/springboot

WORKDIR /usr/share/application

VOLUME /usr/share/application /var/log/springboot

ENTRYPOINT ["/root/entrypoint.sh"]

CMD /bin/bash

EXPOSE 80