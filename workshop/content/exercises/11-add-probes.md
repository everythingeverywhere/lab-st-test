### 
**Add The Readiness Probe**

```editor:insert-value-into-yaml
file: ~/exercises/deployment.yaml
path: spec.template.spec.containers
value:
        readinessProbe:
          httpGet:
            port: 8080
            path: /actuator/health/readiness
```


### 
**Add The Liveness Probe**

```editor:insert-value-into-yaml
file: ~/exercises/deployment.yaml
path: spec.template.spec.containers
value:
        livenessProbe:
          httpGet:
            port: 8080
            path: /actuator/health/liveness
```