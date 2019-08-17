export GO111MODULE:=on

APP_NAME := releasenote-operator
GROUP_NAME := takitake
PKG_PATH := pkg/apis/$(GROUP_NAME)/v1alpha1
TYPES_FILE := $(PKG_PATH)/releasenote_types.go
GENERATED_OPENAPI  := $(PKG_PATH)/zz_generated.openapi.go
GENERATED_DEEPCOPY := $(PKG_PATH)/zz_generated.deepcopy.go
SOURCES := $(shell find . -name '*.go' -not -path "*/vendor/*")
MANIFESTS := $(shell find deploy -name '*.yaml')

build: $(GENERATED_OPENAPI) $(GENERATED_DEEPCOPY) build/_output/bin/$(APP_NAME)

$(GENERATED_OPENAPI): $(TYPES_FILE)
	operator-sdk generate k8s

$(GENERATED_DEEPCOPY): $(TYPES_FILE)
	operator-sdk generate k8s

build/_output/bin/$(APP_NAME): $(SOURCES) build/Dockerfile
	operator-sdk build $(GROUP_NAME)/$(APP_NAME)

deploy: $(MANIFESTS)
	kustomize build deploy/ | kubectl apply -f -

.PHONY: clean
clean:
	rm -fr build/_output
	kustomize build deploy/ | kubectl delete -f -
