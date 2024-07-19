package source_unit_listener

import (
	"fmt"
	parser "solidity_parser/antlr_parser"
	"strings"

	"github.com/google/uuid"
)

type StructDefinition struct {
	Id          string               `json:"id"`
	Name        string               `json:"name"`
	Fields      []VariableDefinition `json:"fields"`
	Description string               `json:"description"`
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

func (su *StructDefinition) GetId() string {
	return su.Id
}

func (su *StructDefinition) SetDescription(description string) {
	su.Description = description
}

func (su *StructDefinition) UpdateDescription(id string, description string) {
	if su.Id == id {
		su.SetDescription(description)
	}

	for i := range su.Fields {
		su.Fields[i].UpdateDescription(id, description)

	}

}
