
### 
**Update The Container & Apply The Updated Deployment YAML**

Let’s update the `pom.xml` to configure the image name explicitly:


```editor:insert-lines-before-line
file: demo/pom.xml
line: 17
text: |
	<spring-boot.build-image.imageName>localhost:5000/apps/demo</spring-boot.build-image.imageName>
```


Then we can build and push the changes and re-deploy:


```
$ ./mvnw clean spring-boot:build-image
$ docker push localhost:5000/apps/demo
$ kubectl apply -f ./k8s

```


*   An updated Pod will be created and started and the old one will be terminated
*   If you use `watch -n 1 kubectl get all` to see all the Kubernetes resources you will be able to see this appen in real time


---
