
*   Kustomize offers a way of generating config maps and secrets as part of our customizations
*   Create a file called `application.yaml` in `kustomize/base` and add the following content


```
logging:
  level:
    org:
      springframework: INFO

```



*   We can now tell Kustomize to generate a config map from this file, in `kustomize/base/kustomization.yaml` by adding the following snippet to the end of the file


```
configMapGenerator:
  - name: k8s-demo-app-config
    files:
      - application.yaml

```



*   If you now run `$ kustomize build` you will see a config map resource is produced


```
$ kustomize build kustomize/base
apiVersion: v1
data:
  application.yaml: |-
    logging:
      level:
        org:
          springframework: INFO
kind: ConfigMap
metadata:
  name: k8s-demo-app-config-fcc4c2fmcd
```


By default `kustomize` generates a random name suffix for the `ConfigMap`. Kustomize will take care of reconciling this when the `ConfigMap` is referenced in other places (ie in volumes). It does this to force a change to the `Deployment` and in turn force the app to be restarted by Kubernetes. This isn’t always what you want, for instance if the `ConfigMap` and the `Deployment` are not in the same `Kustomization`. If you want to omit the random suffix, you can set `behavior=merge` (or `replace`) in the `configMapGenerator`.



*   Now edit `deployment.yaml` in `kustomize/base` to have kubernetes create a volume for that config map and mount that volume in the container


```
apiVersion: apps/v1
kind: Deployment
...
spec:
   ...
  template:
    ...
    spec:
      containers:
      - image: localhost:5000/apps/demo
        name: k8s-demo-app
        ...
        volumeMounts:
          - name: config-volume
            mountPath: /workspace/config
      volumes:
        - name: config-volume
          configMap:
            name: k8s-demo-app-config

```



*   In the above `deployment.yaml` we are creating a volume named `config-volume` from the config map named `k8s-demo-app-config`
*   In the container we are mounting the volume named `config-volume` within the container at the path `/workspace/config`
*   Spring Boot automatically looks in `./config` for application configuration and if present will use it (because the app is running in `/workspace`)



---

