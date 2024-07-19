package source_unit_listener

import (
	"fmt"
	parser "solidity_parser/antlr_parser"

	"github.com/google/uuid"
)

type SourceUnit struct {
	Id           string                  `json:"id"`
	Pragmas      []PragmaDirective       `json:"pragmas"`
	Contracts    []ContractDefinition    `json:"contracts"`
	Imports      []ImportDefinition      `json:"imports"`
	Enums        []EnumDefinition        `json:"enums"`
	Events       []EventDefinition       `json:"events"`
	Structs      []StructDefinition      `json:"structs"`
	Functions    []FunctionDefinition    `json:"functions"`
	CustomErrors []CustomErrorDefinition `json:"errors"`
	Description  string                  `json:"description"`
}

func (s *SourceUnitListener) EnterSourceUnit(ctx *parser.SourceUnitContext) {

	sourceUnit := &SourceUnit{
		Id: uuid.NewString(),
	}
	s.SourceUnit = sourceUnit
}

func (s *SourceUnitListener) ExitSourceUnit(ctx *parser.SourceUnitContext) {

}

func (su *SourceUnit) GetCodeAsString() string {

	var combinedPragma string
	for _, p := range su.Pragmas {
		combinedPragma += p.GetCodeAsString()
	}

	var combinedImports string
	for _, i := range su.Imports {
		combinedImports += i.GetCodeAsString()
	}

	var combinedEvents string
	for _, e := range su.Events {
		combinedEvents += e.GetCodeAsString()
	}

	var combinedStructs string
	for _, s := range su.Structs {
		combinedStructs += s.GetCodeAsString()
	}

	var combinedEnums string
	for _, e := range su.Enums {
		combinedEnums += e.GetCodeAsString()
	}

	var combinedContracts string
	for _, c := range su.Contracts {
		combinedContracts += c.GetCodeAsString()
	}

	var combinedFunctions string
	for _, f := range su.Functions {
		combinedFunctions += f.GetCodeAsString()
	}

	var combinedErrors string
	for _, e := range su.CustomErrors {
		combinedErrors += e.GetCodeAsString()
	}

	result := fmt.Sprintf(
		template,
		combinedPragma,
		combinedImports,
		combinedEvents,
		combinedStructs,
		combinedEnums,
		combinedErrors,
		combinedContracts,
		combinedFunctions,
	)

	return result
}

// Template used to reconstruct the code from the SourceUnit
const template string = `
	%s
	%s
	%s
	%s
	%s
	%s
	%s
	%s

	`

func (su *SourceUnit) GetId() string {
	return su.Id
}

func (su *SourceUnit) SetDescription(description string) {
	su.Description = description
}

func (su *SourceUnit) UpdateDescription(id string, description string) {
	if su.Id == id {
		su.SetDescription(description)
	}

	for i := range su.Pragmas {
		su.Pragmas[i].UpdateDescription(id, description)
	}

	for i := range su.Contracts {
		su.Contracts[i].UpdateDescription(id, description)
	}

	for i := range su.Imports {
		su.Imports[i].UpdateDescription(id, description)
	}

	for i := range su.Enums {
		su.Enums[i].UpdateDescription(id, description)
	}

	for i := range su.Events {
		su.Events[i].UpdateDescription(id, description)
	}

	for i := range su.Structs {
		su.Structs[i].UpdateDescription(id, description)
	}

	for i := range su.Functions {
		su.Functions[i].UpdateDescription(id, description)
	}

	for i := range su.CustomErrors {
		su.CustomErrors[i].UpdateDescription(id, description)
	}

}
