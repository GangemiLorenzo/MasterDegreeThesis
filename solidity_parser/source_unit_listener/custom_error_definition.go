package source_unit_listener

import (
	"fmt"
	parser "solidity_parser/antlr_parser"
	"strings"

	"github.com/google/uuid"
)

type CustomErrorDefinition struct {
	Id          string                `json:"id"`
	Name        string                `json:"name"`
	Parameters  []ParameterDefinition `json:"parameters"`
	Description string                `json:"description"`
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

}

func (s *SourceUnitListener) ExitCustomErrorDefinition(ctx *parser.CustomErrorDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastCustomError := s.LastCustomError()
	lastCustomError.Name = name

	s.IsInCustomError = false

}

func (su *CustomErrorDefinition) GetId() string {
	return su.Id
}

func (su *CustomErrorDefinition) SetDescription(description string) {
	su.Description = description
}

func (su *CustomErrorDefinition) UpdateDescription(id string, description string) {
	if su.Id == id {
		su.SetDescription(description)

	}

	for i := range su.Parameters {
		su.Parameters[i].UpdateDescription(id, description)

	}

}

func (ed *CustomErrorDefinition) GetCodeAsString() string {
	var parameterStrings []string

	for _, p := range ed.Parameters {
		parameterStrings = append(parameterStrings, p.GetCodeAsString())
	}

	combinedParameters := strings.Join(parameterStrings, ", ")

	return fmt.Sprintf(errorTemplate, ed.Name, combinedParameters)

}

const errorTemplate = `error %s(%s);
	`
