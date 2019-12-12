#!/bin/bash

echo "*********************************"
echo "****** Building image ***********"
echo "*********************************"

WORKSPACE=/home/ashish/jenkins-data/jenkins_home/workspace/pipe-job

#Creating Jar File
docker run --rm -v $PWD:/app -v /root/.m2:/root/.m2 -w /app maven:3-alpine "$@"

#Creating Image
docker build -t snapvocabularyservice -f  src/main/docker/Dockerfile .

#Deleting container if their is any
docker stop snapvocabularyservice
docker rm snapvocabularyservice

#Creating COntainer
docker run --name snapvocabularyservice  -d -p 8081:8080 snapvocabularyservice

#docker build -t test:latest -f setup/docker/Dockerfile .

#docker run --rm  -v  $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
