FROM openjdk
VOLUME /tmp
ADD /home/ashish/jenkins-data/snapvocabularywebservice/SnapVocabularyWebService/target/*.jar myapp.jar
RUN sh -c 'touch /myapp.jar'
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "myapp.jar"]
