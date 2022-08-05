FROM maven:3.5-jdk-7-alpine as build
WORKDIR /app
COPY . /src/main
WORKDIR /src/main
RUN mvn install

FROM tomcat:jre8 as server
WORKDIR /app
COPY --from=build /app/target/EugeneLab.war /app/ROOT.war
CMD ["java ROOT.war]