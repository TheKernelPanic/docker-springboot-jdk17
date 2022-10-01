#!/bin/sh

if [ -z "$JAR_FILENAME" ]; then
  echo "The jar file's environment variable has not been set"
  exit 1
fi

sed -i "/^command\=/c\command\=\/usr\/lib\/jvm\/java-$JAVA_VERSION-openjdk-amd64\/bin\/java -DLOGS_PATH="$LOGS_DIRECTORY" -jar \/usr\/share\/application\/$JAR_FILENAME --server.port=80" /etc/supervisor/conf.d/springboot.conf
service supervisor start

exec "$@"