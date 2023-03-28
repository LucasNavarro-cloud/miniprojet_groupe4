FROM maven:latest as build
WORKDIR /usr/src/main
COPY . .
RUN mvn -f ./pom.xml clean package
CMD ["ls", "./target/hello-world-maven.war"]

 

FROM jetty:latest
COPY --from=build /usr/src/main/target/hello-world-maven.war ./webapps
EXPOSE 8080
CMD java -jar "$JETTY_HOME/start.jar" 
