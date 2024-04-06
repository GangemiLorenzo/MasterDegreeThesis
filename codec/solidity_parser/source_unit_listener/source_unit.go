package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

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

	result := fmt.Sprintf(
		template,
		combinedPragma,
		combinedImports,
		combinedEvents,
		combinedStructs,
		combinedEnums,
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

	`
