export GO111MODULE:=on

SOURCES = $(shell find . -name '*.go' -not -path "*/vendor/*")

build: generate/k8s build/image

generate/k8s: pkg/apis/takitake/v1alpha1/releasenote_types.go
	operator-sdk generate k8s

build/image: $(SOURCES)
	operator-sdk build takitake/releasenote-operator
