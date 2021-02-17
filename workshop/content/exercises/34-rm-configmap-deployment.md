
*   Before continuing lets remove our config map and revert the changes we made to `deployment.yaml`
*   To delete the config map run the following command


```
$ kubectl delete configmap log-level

```



*   In `kustomize/base/deployment.yaml` remove the `envFrom` properties we added
*   Next we will use Kustomize to make generating config maps easier



---
