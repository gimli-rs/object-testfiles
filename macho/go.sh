#!/bin/sh

GOTOOLCHAIN=go1.22.4 GOOS=darwin GOARCH=arm64 go build -o go-aarch64 go.go 
GOTOOLCHAIN=go1.22.4 GOOS=darwin GOARCH=amd64 go build -o go-x86_64 go.go 