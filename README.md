# Docker - Springboot JDK 17 :coffee: :coffee:

___

## ENVIRONMENT VARIABLES 

__JAR_FILENAME__: Name of jar file on work directory

## EXAMPLE 

```bash
docker run -dit -v "$pwd:/usr/share/application" -e JAR_FILENAME="example-application.jar" -p "80:80" --name "java-application" onkernelpanic/docker-springboot-jdk17
```
