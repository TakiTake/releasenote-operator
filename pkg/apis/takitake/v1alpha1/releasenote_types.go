package v1alpha1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// EDIT THIS FILE!  THIS IS SCAFFOLDING FOR YOU TO OWN!
// NOTE: json tags are required.  Any new fields you add must have json tags for the fields to be serialized.

// ReleaseNoteSpec defines the desired state of ReleaseNote
// +k8s:openapi-gen=true
type ReleaseNoteSpec struct {
	// INSERT ADDITIONAL SPEC FIELDS - desired state of cluster
	// Important: Run "operator-sdk generate k8s" to regenerate code after modifying this file
	// Add custom validation using kubebuilder tags: https://book-v1.book.kubebuilder.io/beyond_basics/generating_crd.html
}

// ReleaseNoteStatus defines the observed state of ReleaseNote
// +k8s:openapi-gen=true
type ReleaseNoteStatus struct {
	// INSERT ADDITIONAL STATUS FIELD - define observed state of cluster
	// Important: Run "operator-sdk generate k8s" to regenerate code after modifying this file
	// Add custom validation using kubebuilder tags: https://book-v1.book.kubebuilder.io/beyond_basics/generating_crd.html
}

// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// ReleaseNote is the Schema for the releasenotes API
// +k8s:openapi-gen=true
// +kubebuilder:subresource:status
type ReleaseNote struct {
	metav1.TypeMeta   `json:",inline"`
	metav1.ObjectMeta `json:"metadata,omitempty"`

	Spec   ReleaseNoteSpec   `json:"spec,omitempty"`
	Status ReleaseNoteStatus `json:"status,omitempty"`
}

// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// ReleaseNoteList contains a list of ReleaseNote
type ReleaseNoteList struct {
	metav1.TypeMeta `json:",inline"`
	metav1.ListMeta `json:"metadata,omitempty"`
	Items           []ReleaseNote `json:"items"`
}

func init() {
	SchemeBuilder.Register(&ReleaseNote{}, &ReleaseNoteList{})
}
