package controller

import (
	"github.com/TakiTake/releasenote-operator/pkg/controller/releasenote"
)

func init() {
	// AddToManagerFuncs is a list of functions to create controllers and add them to a manager.
	AddToManagerFuncs = append(AddToManagerFuncs, releasenote.Add)
}
