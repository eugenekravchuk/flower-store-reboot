# Use a base image that supports Java
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven or Gradle build file and the source code
COPY pom.xml .
# or
# COPY build.gradle .  # For Gradle

# Copy the source code
COPY src ./src

# Install dependencies (for Maven)
RUN mvn clean package -DskipTests

# For Gradle, you would typically use
# RUN ./gradlew build -x test

# Copy the jar file to the container
COPY target/myapp.jar app.jar  # For Maven
# or
# COPY build/libs/myapp.jar app.jar  # For Gradle

# Specify the command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
