FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY . /src/main
WORKDIR /src/main
RUN mvn install

FROM openjdk:7-jre-alpine
WORKDIR /app
COPY --from=build /app/target/EugeneLab.war /app/ROOT.war
CMD ["java ROOT.war]