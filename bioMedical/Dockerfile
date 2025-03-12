# Build stage
FROM maven:3.8.4-openjdk-8 AS build
WORKDIR /app

# Copy and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build the project
COPY src ./src
RUN mvn package -DskipTests

# Run stage
FROM openjdk:8-jdk-alpine
WORKDIR /app

# Copy the generated WAR file
COPY --from=build /app/target/*.war app.war

# Expose port 8080 for the application
EXPOSE 8080

# Corrected ENTRYPOINT to run a WAR file
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/app.war"]

