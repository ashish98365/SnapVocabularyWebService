#!/bin/bash

echo "*********************************"
echo "****** Building image ***********"
echo "*********************************"

WORKSPACE=/home/ashish/jenkins-data/jenkins_home/workspace/pipe-job

#Creating Jar File
docker run --rm -v /home/ashish/jenkins-data/jenkins_home/workspace/snap-vocabulary-service/:/app -v /root/.m2:/root/.m2 -w /app maven:3-alpine "$@"


#Deleting container if their is any
docker stop snapvocabularyservice
docker rm snapvocabularyservice

#Copy jar file
#cp -f target/*.jar .

#Creating Image
docker build -t snapvocabularyservice -f  src/main/docker/Dockerfile .

#Creating Container
docker run --name snapvocabularyservice  -d -p 8081:8080 snapvocabularyservice

#docker build -t test:latest -f setup/docker/Dockerfile .

#docker run --rm  -v  $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"

