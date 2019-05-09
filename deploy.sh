# Build docker images to 2 tags
# Tag `latest` to make sure the latest image always up-to-date to last build
# Tag `$COMMIT_SHA` dynamically set tag name to `Git commit hash` to update images
# on K8s *deployments*
docker build -t turbothinh/k8s-boiler-client:latest -f ./client/Dockerfile ./client
docker build -t turbothinh/k8s-boiler-client:$COMMIT_SHA -f ./client/Dockerfile ./client

docker build -t turbothinh/k8s-boiler-server:latest -f ./server/Dockerfile ./server
docker build -t turbothinh/k8s-boiler-server:$COMMIT_SHA -f ./server/Dockerfile ./server

docker build -t turbothinh/k8s-boiler-redis-worker:latest -f ./redis-worker/Dockerfile ./redis-worker
docker build -t turbothinh/k8s-boiler-redis-worker:$COMMIT_SHA -f ./redis-worker/Dockerfile ./redis-worker

# Push docker images
docker push turbothinh/k8s-boiler-client:latest
docker push turbothinh/k8s-boiler-client:$COMMIT_SHA

docker push turbothinh/k8s-boiler-server:latest
docker push turbothinh/k8s-boiler-server:$COMMIT_SHA

docker push turbothinh/k8s-boiler-redis-worker:latest
docker push turbothinh/k8s-boiler-redis-worker:$COMMIT_SHA

# Apply K8s configs
kubectl apply -f k8s

# Explicitly update images with Commit hash tag to force K8s *deployments* update
kubectl set image deployments/server-deployment server=turbothinh/k8s-boiler-server:$COMMIT_SHA
kubectl set image deployments/client-deployment fe-react=turbothinh/k8s-boiler-client:$COMMIT_SHA
kubectl set image deployments/redis-worker-deployment redis-worker=turbothinh/k8s-boiler-redis-worker:$COMMIT_SHA