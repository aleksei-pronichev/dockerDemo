# FROM arm64v8/openjdk:11-jre
# FROM bellsoft/liberica-openjre-debian:11-aarch64
FROM bellsoft/liberica-openjdk-alpine:11-aarch64
MAINTAINER Aleksei Pronichev <aleksei.pronichev@outlook.com>
#ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/myservice/test.jar"]

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
#ADD target/lib           /usr/share/myservice/lib
# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/share/myservice/test.jar

CMD ["java", "-jar", "/usr/share/myservice/test.jar"]
