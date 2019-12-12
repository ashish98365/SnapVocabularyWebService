FROM openjdk
VOLUME /tmp
ADD target/*.jar myapp.jar
RUN sh -c 'touch /myapp.jar'
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "myapp.jar"]
