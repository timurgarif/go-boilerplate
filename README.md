# Tiny boilerplate for a new Go service
## Prerequisites
- a Go version with Go Modules support
- golangci-lint (can be replaced in `script/run.sh` for whatever you prefer)
- github.com/cespare/reflex

To install both the linter and Reflex
```
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.27.0 \
&& GO111MODULE=on go get github.com/cespare/reflex
```

## What's included
- Docker image for prod build
- [Reflex](https://github.com/cespare/reflex)-based live restart of lint/vet/test on a source file change
- No Go code except for `cmd/service.go` main package boilerplate

## Get started
Set real names for the new repo and Go module
```
export NEW_PROJECT_NAME=my-repo-name 
export NEW_MODULE_NAME=example.com/myservice
```

Init
```
git clone https://github.com/timurgarif/go-boilerplate $NEW_PROJECT_NAME \
&& cd $NEW_PROJECT_NAME \
&& echo "# $NEW_PROJECT_NAME" > README.md \
&& sed -i 's%example.com/myservice%'"$NEW_MODULE_NAME"'%g' makefile \
&& sed -i 's%go.boilerplate%'"$NEW_PROJECT_NAME"'%g' cmd/service.go \
&& rm -rf .git \
&& git init \
&& go mod init $NEW_MODULE_NAME \
&& git add . && git commit -m 'Initial commit' \
&& git tag v0.1.0 -m 'Initial version v0.1.0' \
&& unset NEW_PROJECT_NAME NEW_MODULE_NAME
```

### Run
```
make run
```
For the command to work smoother you may also want 
- to turn off autosave or increase autosave delay for your IDE to postpone re-runs until explicit code save
- disable linting etc. by IDE to avoid double work

### Build prod Docker image
```
make build
```