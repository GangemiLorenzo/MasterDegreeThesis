package source_unit_listener

import (
	"fmt"
	parser "solidity_parser/antlr_parser"
	"strings"

	"github.com/google/uuid"
)

type EnumDefinition struct {
	Id          string   `json:"id"`
	Name        string   `json:"name"`
	Values      []string `json:"values"`
	Description string   `json:"description"`
}

func (s *SourceUnitListener) EnterEnumDefinition(ctx *parser.EnumDefinitionContext) {
	enum := EnumDefinition{
		Id: uuid.NewString(),
	}
	if s.IsInContract {
		lastContract := s.LastContract()
		lastContract.Enums = append(lastContract.Enums, enum)
	} else {
		s.SourceUnit.Enums = append(s.SourceUnit.Enums, enum)
	}

}

func (s *SourceUnitListener) ExitEnumDefinition(ctx *parser.EnumDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastEnum := s.LastEnum()
	lastEnum.Name = name

}

func (s *SourceUnitListener) EnterEnumValue(ctx *parser.EnumValueContext) {

}

func (s *SourceUnitListener) ExitEnumValue(ctx *parser.EnumValueContext) {
	value := ctx.Identifier().GetText()
	lastEnum := s.LastEnum()
	lastEnum.Values = append(lastEnum.Values, value)

}

func (ed *EnumDefinition) GetCodeAsString() string {
	combinedValues := strings.Join(ed.Values, `,
		`)

	return fmt.Sprintf(enumTemplate, ed.Name, combinedValues)

}

const enumTemplate = `enum %s {
		%s
	}

	`

func (su *EnumDefinition) GetId() string {
	return su.Id
}

func (su *EnumDefinition) SetDescription(description string) {
	su.Description = description
}

func (su *EnumDefinition) UpdateDescription(id string, description string) {
	if su.Id == id {
		su.SetDescription(description)
	}

}
