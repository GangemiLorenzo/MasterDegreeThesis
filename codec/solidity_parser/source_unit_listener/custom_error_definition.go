package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type CustomErrorDefinition struct {
	Id         string                `json:"id"`
	Name       string                `json:"name"`
	Parameters []ParameterDefinition `json:"parameters"`
}

func (s *SourceUnitListener) EnterCustomErrorDefinition(ctx *parser.CustomErrorDefinitionContext) {
	s.IsInCustomError = true

	customError := CustomErrorDefinition{
		Id: uuid.NewString(),
	}
	if s.IsInContract {
		lastContract := s.LastContract()
		lastContract.CustomErrors = append(lastContract.CustomErrors, customError)
	} else {
		s.SourceUnit.CustomErrors = append(s.SourceUnit.CustomErrors, customError)
	}

	fmt.Println("Enter Custom Error Definition")
}

func (s *SourceUnitListener) ExitCustomErrorDefinition(ctx *parser.CustomErrorDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastCustomError := s.LastCustomError()
	lastCustomError.Name = name

	s.IsInCustomError = false

	fmt.Println("Exit Custom Error Definition")
}
