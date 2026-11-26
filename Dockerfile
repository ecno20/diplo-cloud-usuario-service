#Usa la imagen oficial de Maven como imagen base
FROM maven:3.8.5-openjdk-17-slim AS build
#Etiqueta del autor
LABEL author="Jonathan ecno20"
# a default value
#LegacyKeyValueFormat: "ENV key=value"
ENV MONGO_HOSTNAME=localhost
ENV MONGO_DB=veterinaria
ENV MONGO_USER=usuario_owner
ENV MONGO_PWD=usuario_password
ENV TOMCAT_PORT=8080
ENV MONGO_AUTHDB=admin
ENV MONGO_PORT=27017
EXPOSE 27017
EXPOSE 8084
#Copian los archivos de configuración y el código fuente
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
#Establece el directorio de trabajo
WORKDIR /usr/src/app
#Compila la aplicación
RUN mvn clean install
#Cambia una imagen más ligera de Java para la ejecución
FROM eclipse-temurin:25
#Copia el archivo JAR generado en la etapa anterior
#COPY --from=build /usr/src/app/target/diplo-cloud-disco-service-0.0.1-SNAPSHOT.jar /app/diplo-cloud-disco-service.jar
COPY --from=build /usr/src/app/target/diplo-cloud-usuario-service.jar /app/diplo-cloud-usuario-service.jar
#Expone el puerto en el que la aplicación se ejecutará
EXPOSE 8080
#Comando para ejecutar la aplicación al iniciar el contenedor
CMD ["java", "-jar", "/app/diplo-cloud-usuario-service.jar"]