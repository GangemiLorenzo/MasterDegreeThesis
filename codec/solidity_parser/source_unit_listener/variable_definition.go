package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type VariableDefinition struct {
	Id          string   `json:"id"`
	Name        string   `json:"name"`
	Type        string   `json:"type"`
	Visibility  string   `json:"visibility"`
	Modifiers   []string `json:"modifiers"`
	MappingFrom string   `json:"mappingFrom"`
	MappingTo   string   `json:"mappingTo"`
}

func (s *SourceUnitListener) EnterStateVariableDeclaration(ctx *parser.StateVariableDeclarationContext) {
	stateVariable := VariableDefinition{
		Id: uuid.NewString(),
	}
	lastContract := s.LastContract()
	lastContract.Variables = append(lastContract.Variables, stateVariable)

	fmt.Println("Enter State Variable Declaration")
}

func (s *SourceUnitListener) ExitStateVariableDeclaration(ctx *parser.StateVariableDeclarationContext) {
	var modifiers []string

	name := ctx.Identifier().GetText()
	typeStr := ctx.TypeName().GetText()
	if typeStr == "addresspayable" {
		modifiers = append(modifiers, "payable")
		typeStr = "address"
	}

	// Check for visibility and other modifiers
	if len(ctx.AllPublicKeyword()) > 0 {
		modifiers = append(modifiers, "public")
	}
	if len(ctx.AllPrivateKeyword()) > 0 {
		modifiers = append(modifiers, "private")
	}
	if len(ctx.AllInternalKeyword()) > 0 {
		modifiers = append(modifiers, "internal")
	}
	if len(ctx.AllConstantKeyword()) > 0 {
		modifiers = append(modifiers, "constant")
	}
	if len(ctx.AllImmutableKeyword()) > 0 {
		modifiers = append(modifiers, "immutable")
	}
	// Handle override specifiers if necessary
	// Note: This example does not extract specific information from override specifiers,
	// but you could expand this to capture more detailed info if needed.
	if len(ctx.AllOverrideSpecifier()) > 0 {
		modifiers = append(modifiers, "override")
	}

	// Create a new variable with the collected information
	variable := VariableDefinition{
		Name:      name,
		Type:      typeStr,
		Modifiers: modifiers,
	}

	// Determine visibility if it's specified as one of the modifiers
	// This is a simplified approach; you might refine it based on your needs.
	for _, mod := range modifiers {
		switch mod {
		case "public", "private", "internal":
			variable.Visibility = mod
			break // Found visibility, no need to check further
		}
	}

	// Assuming you have a method to add the variable to your source unit
	lastStateVariable := s.LastStateVariable()
	lastStateVariable.Name = variable.Name
	lastStateVariable.Type = variable.Type
	lastStateVariable.Visibility = variable.Visibility
	lastStateVariable.Modifiers = variable.Modifiers

	fmt.Printf("Exited State Variable Declaration: %+v\n", variable)
}

func (s *SourceUnitListener) EnterVariableDeclaration(ctx *parser.VariableDeclarationContext) {
	variable := VariableDefinition{
		Id: uuid.NewString(),
	}
	if s.IsInStruct {
		lastStruct := s.LastStruct()
		lastStruct.Fields = append(lastStruct.Fields, variable)
	}
	fmt.Println("Enter Variable Declaration")
}

func (s *SourceUnitListener) ExitVariableDeclaration(ctx *parser.VariableDeclarationContext) {
	name := ctx.Identifier().GetText()
	typeStr := ctx.TypeName().GetText()

	if s.IsInStruct {
		lastField := s.LastStructField()
		lastField.Name = name
		lastField.Type = typeStr
	}

	fmt.Println("Exit Variable Declaration")
}

func (s *SourceUnitListener) EnterMapping(ctx *parser.MappingContext) {
	lastVariable := s.LastStateVariable()
	lastVariable.Type = "mapping"
	fmt.Println("Enter Mapping")
}

func (s *SourceUnitListener) ExitMapping(ctx *parser.MappingContext) {
	from := ctx.MappingKey().GetText()
	to := ctx.TypeName().GetText()

	lastVariable := s.LastStateVariable()
	lastVariable.MappingFrom = from
	lastVariable.MappingTo = to

	fmt.Println("Exit Mapping")
}
