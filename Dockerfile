FROM openjdk:17-jdk-alpine
VOLUME /tmp
COPY target/sample-app-4.0.0.war demo.war
ENTRYPOINT ["java", "-jar", "/demo.war"]

