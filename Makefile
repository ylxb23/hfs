.PHONY: all

all: protogen fmt vet test build
	echo "success"

fmt:
	go fmt ./...

vet:
	go vet -v ./...

test:
	go test -race -cover ./...

build:
	go build -o bin/chunkserver cmd/chunkserver/main.go

protogen:
	protoc -I pb pb/**/*.proto --go_out=plugins=grpc:pb
