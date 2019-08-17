export GO111MODULE:=on

SOURCES = $(shell find . -name '*.go' -not -path "*/vendor/*")
MANIFESTS = $(shell find deploy -name '*.yaml')

build: generate/k8s build/image

generate/k8s: pkg/apis/takitake/v1alpha1/releasenote_types.go
	operator-sdk generate k8s

build/image: $(SOURCES)
	operator-sdk build takitake/releasenote-operator

deploy: $(MANIFESTS)
	kubectl apply -f deploy/crds/takitake_v1alpha1_releasenote_crd.yaml
	kubectl apply -f deploy/role.yaml
	kubectl apply -f deploy/role_binding.yaml
	kubectl apply -f deploy/service_account.yaml
	kubectl apply -f deploy/operator.yaml
	kubectl apply -f deploy/crds/takitake_v1alpha1_releasenote_cr.yaml

clean: $(MANIFESTS)
	kubectl delete -f deploy/crds/takitake_v1alpha1_releasenote_cr.yaml
	kubectl delete -f deploy/operator.yaml
	kubectl delete -f deploy/role.yaml
	kubectl delete -f deploy/role_binding.yaml
	kubectl delete -f deploy/service_account.yaml
	kubectl delete -f deploy/crds/takitake_v1alpha1_releasenote_crd.yaml
