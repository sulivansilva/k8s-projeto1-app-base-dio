#!/bin/bash

echo "Criando as imagens..."

docker build -t sulivan08/projeto-backend:1.0 backend/.
docker build -t sulivan08/projeto-database:1.0 database/.

echo "Realizando push das imagens no Docker Hub..."

docker push sulivan08/projeto-backend:1.0
docker push sulivan08/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml








