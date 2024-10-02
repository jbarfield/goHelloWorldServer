# HelloWorldGoServer - Example Go Application
## https://github.com/td-harness/goHelloWorldServer

An example "Hello World" golang web application.

This README.md is constantly evolving. 

I forked this work from td-harness who forked the original source from nofarb.
 
* https://github.com/td-harness
* https://github.com/nofarb

I made an attempt at simplifing the repository and content; removing tests, 
conflicts, etc, and structuring the same in such a way as to keep it very 
small and readable for my PPT presentation to Harness management. 

Dependencies:
* go 
* docker
---

## Running the app locally
```
go build -o main .
./main
```
`2024/09/26 11:38:11 Starting Server`
## Test
`curl http://localhost:8080?name=jbarfield`

Hello, jbarfield

## Harness CI/CD Deployment Notes

### Requirements
* Harness Trial Account
Optional: github - oAuth access [SSO Harness Account Access]
* github - ssh-rsa-key [Pem Format Private key]
`ssh-keygen -t rsa -m PEM -b 2048`
* github - api access [personal access token] settings/developer/PAT classic
* harness-kubernetes-delegate [Install to cluster]
`kubectl --kubeconfig <KUBECONFIG> apply -f https://github.com/harness/delegate-kubernetes-manifest/blob/main/harness-delegate.yaml`
* dockerhub account - hub.docker.com
* docker_hub_connector [See: harness UI]
* docker_hub project Public Read/Write Docker Image
* 

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
* ciStage [docker/image/build] = .harness/harnesstestproject0002.yaml
* cdStage [harness_service/deploy_definition stage] = .harness/harnessIohelloworldservice.yaml
* k8sInfrastructure = .harness/infrastructure.yaml
* k8sManifest = harnesscd-stage/harness-helloworld-service.yaml
