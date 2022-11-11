echo "criando as imagens docker..."

docker build -t fq1444/projeto-backend:1.0 backend/.

docker build -t fq1444/projeto-database:1.0 database/.

echo "realizando o push da imagens"

docker push  fq1444/projeto-backend:1.0
docker push  fq1444/projeto-database:1.0

echo "criando sevicos no cluster kubernets.."

kubectl apply -f ./services.yml

echo "criando os deployment"

kubectl apply -f ./deployment.yml
kubectl apply -f ./deployment2.yml
kubectl apply -f ./deployment3.yml