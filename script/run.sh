#!/bin/sh

set -e

export CGO_LDFLAGS='-s -w -L/usr/local/lib -lrocksdb -lstdc++ -lm -lz -lbz2 -lsnappy -llz4 -lzstd' 
export ORIGIN_HOST=https://test.liteka.com

golangci-lint run ./...
echo 'lint OK'
go vet ./...
echo 'go vet OK'
go test -short ./...
echo 'go test OK'
go run cmd/service.go