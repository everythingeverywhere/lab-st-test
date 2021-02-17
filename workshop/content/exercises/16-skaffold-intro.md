**Skaffold**

*   [Skaffold](https://github.com/GoogleContainerTools/skaffold) is a command line tool that facilitates continuous development for Kubernetes applications
*   Simplifies the development process by combining multiple steps into one easy command
*   Provides the building blocks for a CI/CD process
*   Make sure you have Skaffold installed before continuing


```
$ skaffold version
v1.9.1
```



### 
**Adding Skaffold YAML**



*   Skaffold is configured using…you guessed it…another YAML file
*   We create a YAML file `skaffold.yaml` in the root of the project


```editor:append-lines-to-file
file: skaffold.yaml
text: |
        apiVersion: skaffold/v2beta5
        kind: Config
        metadata:
          name: k-s-demo-app--
        build:
          artifacts:
          - image: localhost:5000/apps/demo
            buildpacks:
              builder: gcr.io/paketo-buildpacks/builder:base-platform-api-0.3
              dependencies:
                paths:
                - demo/src
                - demo/pom.xml
        deploy:
          kubectl:
            manifests:
            - k8s/deployment.yaml
            - k8s/service.yaml
            - k8s/ingress.yaml
```


The `builder` is the same one used by Spring Boot when it builds a container from the build plugins (you would see it logged on the console when you build the image). Instead of the `buildpacks` builder you could use the `custom` one (with the same `dependencies`):


```
   custom:
      buildCommand: ./mvnw spring-boot:build-image -D spring-boot.build-image.imageName=$IMAGE && docker push $IMAGE
```



