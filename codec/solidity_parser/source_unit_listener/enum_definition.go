package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"

	"github.com/google/uuid"
)

type EnumDefinition struct {
	Id     string   `json:"id"`
	Name   string   `json:"name"`
	Values []string `json:"values"`
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

// EnterEnumValue is called when production enumValue is entered.
func (s *SourceUnitListener) EnterEnumValue(ctx *parser.EnumValueContext) {

}

// ExitEnumValue is called when production enumValue is exited.
func (s *SourceUnitListener) ExitEnumValue(ctx *parser.EnumValueContext) {
	value := ctx.Identifier().GetText()
	lastEnum := s.LastEnum()
	lastEnum.Values = append(lastEnum.Values, value)

}
