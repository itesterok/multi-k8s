docker build -t borovenskiy/multi-client:latest -t borovenskiy/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t borovenskiy/multi-server:latest -t borovenskiy/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t borovenskiy/multi-worker:latest -t borovenskiy/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push borovenskiy/multi-client:latest
docker push borovenskiy/multi-server:latest
docker push borovenskiy/multi-worker:latest
docker push borovenskiy/multi-client:$SHA
docker push borovenskiy/multi-server:$SHA
docker push borovenskiy/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=borovenskiy/multi-server:$SHA
kubectl set image deployments/client-deployment client=borovenskiy/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=borovenskiy/multi-worker:$SHA
