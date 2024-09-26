# HelloWorldGoServer  - Forked
## https://github.com/td-harness/goHelloWorldServer
Dependencies:
* GO 
* Docker
* unit tests

## Running the app locally
```
go build -o main .
./main
```
2024/09/26 11:38:11 Starting Server
## Test
`curl http://localhost:8080?name=jbarfield`

Hello, jbarfield

## Harness CI/CD Deployment Notes

### Required Connectors
github.com/jbarfield
* oAuth account [SSO]
* ssh-rsa-key [Pem Format]
* api access [personal access token]
* kubernetes-delegate `kubectl apply MANIFEST.yaml` [installed in cluster]
* docker_connector [harness UI or CLI]

```
Harness-UI |-> clone app repo <THIS_APP>
           |-> deploy to delegate from ci/pipeline menu
           |-> <k8s-docker-image-build> ----> <push-2-docker-hub>
           |->pull image/deploy pods
           |---->Service/Deployment/Ingress/Yaml-manifest
           |------------->Ingress
           |--->Access web-app: 
https://harness-helloworld.test.kubesmart.io?name=Harness!
```
### Ci/Cd Stages
ciStage [docker/image/build] = .harness/harnesstestproject0002.yaml
cdStage [harness_service/deploy_definition stage] = .harness/harnessIohelloworldservice.yaml
k8sInfrastructure = .harness/infrastructure.yaml
k8sManifest = harnesscd-stage/harness-helloworld-service.yaml
