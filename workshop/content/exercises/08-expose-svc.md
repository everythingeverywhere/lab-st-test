
### 
**Exposing The Service**

*   If we want to expose the service publically we can use an Ingress.

> An Ingress is an API object that defines rules which allow external access to services in a cluster. An Ingress controller fulfills the rules set in the Ingress.

Next, you will go create `k8s/ingress.yaml` so you can access your app externally. 

Click below to highlight the value that needs to change.
```editor:append-lines-to-file
file: k8s/ingress.yaml
text: |
      apiVersion: networking.k8s.io/v1
      kind: Ingress
      metadata:
        name: k8s-demo-app
        labels:
          app: k8s-demo-app
      spec:
        rules:
        - host: YourHost
          http:
            paths:
            - path: "/"
              pathType: Prefix
              backend:
                service:
                  name: k8s-demo-app
                  port: 
                    number: 8080
```

Now, change the the type to `LoadBalancer`
```execute-1
 sed 's/YourHost/k8s-demo-app-${SESSION_NAMESPACE}.${INGRESS_DOMAIN}/g' k8s/ingress.yaml -i
```

*   

Now, apply the `ingress.yaml`, your service, and your Kubernetes deployment.
```execute-1
kubectl apply -f ./k8s
```


Watch the objects being created.
```execute-1
watch -n 1 kubectl get all
```

Be sure to stop the `kubectl port-forward` process before moving on.
```terminal:interrupt-1
```

---


