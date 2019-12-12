FROM openjdk
VOLUME /tmp
ADD *.jar myapp.jar
RUN sh -c 'touch /myapp.jar'
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "myapp.jar"]
