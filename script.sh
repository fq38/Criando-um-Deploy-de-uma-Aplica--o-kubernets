#!/bin/bash

echo "criando as imagens docker..."

docker build -t fq1444/projeto-backend:1.0 backend/.

docker build -t fq1444/projeto-database:1.0 database/.

echo "realizando o push da imagens"

docker push -t fq1444/projeto-backend:1.0
docker push -t fq1444/projeto-database:1.0

echo "criando seviços no cluster kubernets.."

kubectl apply -f ./services.yml

echo "criando os deployment"

kubectl aplly -f ./deployment.yml