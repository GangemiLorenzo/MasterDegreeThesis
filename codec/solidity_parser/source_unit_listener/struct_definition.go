package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type StructDefinition struct {
	Id     string               `json:"id"`
	Name   string               `json:"name"`
	Fields []VariableDefinition `json:"fields"`
}

func (s *SourceUnitListener) EnterStructDefinition(ctx *parser.StructDefinitionContext) {
	s.IsInStruct = true

	structure := StructDefinition{
		Id: uuid.NewString(),
	}
	if s.IsInContract {
		lastContract := s.LastContract()
		lastContract.Structs = append(lastContract.Structs, structure)
	} else {
		s.SourceUnit.Structs = append(s.SourceUnit.Structs, structure)
	}
	fmt.Println("Enter Struct Definition")
}

func (s *SourceUnitListener) ExitStructDefinition(ctx *parser.StructDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastStruct := s.LastStruct()
	lastStruct.Name = name

	s.IsInStruct = false
	fmt.Println("Exit Struct Definition")
}
