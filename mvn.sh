#!/bin/bash

echo "*********************************"
echo "****** Building image ***********"
echo "*********************************"

WORKSPACE=/home/ashish/ashish/work/learning/jenkins/jenkins_home/workspace

#Creating Jar File
docker run --rm -v $WORKSPACE/snapvocabulary-pipeline/:/app -v /root/.m2:/root/.m2 -w /app maven:3-alpine "$@"


#Deleting container if their is any
docker stop snapvocabularyservice
docker rm snapvocabularyservice

#Copy jar file
#cp -f target/*.jar .

#Creating Image
docker build -t snapvocabularyservice -f  src/main/docker/Dockerfile .

#Creating Container
docker run --name snapvocabularyservice  -d -p 8081:8080 snapvocabularyservice
