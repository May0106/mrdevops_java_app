FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY ./target/* /app.jar
CMD ["java", "-jar", "app-jar"]

