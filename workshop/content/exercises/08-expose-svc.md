
### 
**Exposing The Service**

NOTE: `LoadBalancer` features are platform specific. The visibility of your app after changing the service type might depend a lot on where it is deployed (e.g. per cloud provider).



*   If we want to expose the service publically we can change the service type to `LoadBalancer`

Open `k8s/service.yaml` and change `ClusterIp` to `LoadBalancer \
apiVersion: v1`


```
kind: Service
metadata:
  labels:
    app: k8s-demo-app
  name: k8s-demo-app
spec:
...
  type: LoadBalancer
...

```



*   

Now apply the updated `service.yaml \
$ kubectl apply -f ./k8s`



*   



---


