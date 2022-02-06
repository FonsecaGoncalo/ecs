FROM gradle:7.3.3-jdk11 as BUILD_IMAGE
WORKDIR /root/dev/service

COPY gradle gradle
COPY src src
COPY build.gradle settings.gradle ./

RUN gradle build

FROM openjdk:11-jre-slim-buster
WORKDIR /root
COPY --from=BUILD_IMAGE /root/dev/service/build/libs/service-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
CMD ["java", "-jar", "service-0.0.1-SNAPSHOT.jar"]