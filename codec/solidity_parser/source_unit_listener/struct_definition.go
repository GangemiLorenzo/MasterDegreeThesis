package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"
	"strings"

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

}

func (s *SourceUnitListener) ExitStructDefinition(ctx *parser.StructDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastStruct := s.LastStruct()
	lastStruct.Name = name

	s.IsInStruct = false

}

func (sd *StructDefinition) GetCodeAsString() string {
	var fieldStrings []string

	for _, f := range sd.Fields {
		fieldStrings = append(fieldStrings, f.GetCodeAsString())
	}

	combinedFields := strings.Join(fieldStrings, `
		`)

	return fmt.Sprintf(structTemplate, sd.Name, combinedFields)

}

const structTemplate = `struct %s {
		%s
	}

	`
