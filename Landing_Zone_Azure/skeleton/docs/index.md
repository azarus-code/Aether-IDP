# Kubernetes Hello World Node.js

This project is intended to be used as a sample for 
deployment of kubernetes applications. 

Basically this expose 3 apis:
- /ping
- /current-date
- /fibo/:n

The last one is good to test the capacity of the cluster by implement 
a fibonnaci with any number specified. Numbers great than 35 could crash your server :)

# Start

Build the image

```
docker build <registry>/<app-name>
```

Run the Image

```
docker run -d -p 3000:3000 <registry>/<app-name>:latest
```

# Deploying in the Kubernetes cluster

First create the Pods and the autoscale 

```
kubectl apply -f kubernetes/deployment.yml
```

Check if is OK:

```
kubectl get pods -l app=<app-name> -o yaml | grep podIP
```

# Exposing the Api to the World:

Checking:

```
kubectl get service
```

Run this to see the auto scaling working:

```
ab -n 500 -c 10 -s 600 http://<IP>/fibo/35
```

- [Architecture](architecture.md)
- [API Documentation](api.md)
