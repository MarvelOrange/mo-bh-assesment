FROM eclipse-temurin:17-jdk-alpine
RUN addgroup springtinggroup; adduser --ingroup springtinggroup --disabled-password springtinguser
USER springtinguser

WORKDIR /app

COPY react-and-spring-data-rest-0.0.1-SNAPSHOT.jar /app/

EXPOSE 8080
 
CMD ["java", "-jar", "react-and-spring-data-rest-0.0.1-SNAPSHOT.jar"]