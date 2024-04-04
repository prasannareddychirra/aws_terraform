## How to Execute the deployment & service files.
### First update the cluster with the region 
```
aws eks update-kubeconfig --name <EKS_Cluster_Name> --region <Region>
```
### Deployment File
```
kubectl apply -f deployment.yaml
```
### Check the deployment
```
kubectl get all
```
### Apply the Service File 
```
kubectl apply -f service.yaml
```
### Check the Services
```
kubectl get all
```
### Now let’s describe the service and copy the LoadBalancer Ingress
```
kubectl describe service mario-service
```

### Copy the Load Balancer URL and paste in browser

### Destroy the resources 
```
kubectl get all
kubectl delete service mario-service
kubectl delete deployment mario-deployment
```