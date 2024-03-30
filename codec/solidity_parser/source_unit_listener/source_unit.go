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
	fmt.Println("Enter source unit")

	sourceUnit := &SourceUnit{
		Id: uuid.NewString(),
	}
	s.SourceUnit = sourceUnit
}

func (s *SourceUnitListener) ExitSourceUnit(ctx *parser.SourceUnitContext) {
	fmt.Println("Exit source unit")
}
