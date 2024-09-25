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
Hello, barfield
