FROM maven:3.9.9-amazoncorretto-17 as build
WORKDIR /app
COPY . .
RUN mvn clean package -X -DskipTests

FROM openjdk:17-ea-10-jdk-slim
WORKDIR /app
COPY --from=build ./app/target/*.jar ./springAPI.jar
ENTRYPOINT java -jar springAPI.jar
EXPOSE 9091