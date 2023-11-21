FROM maven:3.8.1-openjdk-21-slim


WORKDIR /usr/src/app


COPY . .


RUN mvn clean install


CMD ["java", "-cp", "target/classes", "com.example.HelloWorld"]
