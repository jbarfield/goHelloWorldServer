# HelloWorldGoServer
GO + Docker + unit tests

## Running the app locally
```
# CGO_ENABLED=0 GOOS=linux GOARCH=amd64 
go build -buildvcs=false -o main .
./main
```
2019/02/03 11:38:11 Starting Server
`curl http://localhost:8080?name=barfield`
Hello, jbarfield

## Harness CI/CD Deployment Notes

## Connectors
* github.com/jbarfield/GoHelloWorldServer
* kubernetes-delegate
* docker_connector

ciStage [docker/image/build] = .harness/harnesstestproject0002.yaml
cdStage [harness_service/deploy_definition stage] = .harness/harnessIohelloworldservice.yaml
k8sInfrastructure = .harness/infrastructure.yaml
k8sManifest = harnesscd-stage/harness-helloworld-service.yaml
