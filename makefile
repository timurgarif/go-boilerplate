all: build

.PHONY: run
run:
	reflex -s -r '\.go$$' script/run.sh

.PHONY: ci-test
ci-test:
	go test -tags integration -v ./...	

.PHONY: build
build:
	docker build --target=prod -t example.com/myservice:${shell git describe --abbrev=0 | sed -r "s/^v*(.*)/\1/"} .
