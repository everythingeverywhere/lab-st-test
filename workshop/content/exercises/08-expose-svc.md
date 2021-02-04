
### 
**Exposing The Service**

NOTE: `LoadBalancer` features are platform specific. The visibility of your app after changing the service type might depend a lot on where it is deployed (e.g. per cloud provider).


*   If we want to expose the service publically we can change the service type to `LoadBalancer`

In `k8s/service.yaml` and change `ClusterIp` to `LoadBalancer`


```editor:insert-value-into-yaml
file: k8s/service.yaml
path: spec.type
text: |
value:
      LoadBalancer

```


```editor:select-matching-text
file: k8s/service.yaml
text: type
```


*   

Now apply the updated `service.yaml 
```execute-1
kubectl apply -f ./k8s`
```


*   



---


