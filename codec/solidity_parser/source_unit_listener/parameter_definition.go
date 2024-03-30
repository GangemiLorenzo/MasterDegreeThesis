package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type ParameterDefinition struct {
	Id        string `json:"id"`
	Name      string `json:"name"`
	Type      string `json:"type"`
	Storage   string `json:"storage"`
	IsIndexed bool   `json:"isIndexed"`
}

func (s *SourceUnitListener) EnterReturnParameters(ctx *parser.ReturnParametersContext) {
	s.IsInReturnParameter = true

}

func (s *SourceUnitListener) ExitReturnParameters(ctx *parser.ReturnParametersContext) {
	s.IsInReturnParameter = false

}

// EnterParameter is called when production parameter is entered.
func (s *SourceUnitListener) EnterParameter(ctx *parser.ParameterContext) {
	parameter := ParameterDefinition{
		Id: uuid.NewString(),
	}

	if s.IsInCustomError {
		lastCustomError := s.LastCustomError()
		lastCustomError.Parameters = append(lastCustomError.Parameters, parameter)
		return
	}

	lastFunction := s.LastFunctionDefinition()
	if s.IsInReturnParameter {
		lastFunction.Returns = append(lastFunction.Returns, parameter)
		return
	}
	lastFunction.Parameters = append(lastFunction.Parameters, parameter)

}

// ExitParameter is called when production parameter is exited.
func (s *SourceUnitListener) ExitParameter(ctx *parser.ParameterContext) {

	typeStr := ctx.TypeName().GetText()

	var name string
	if ctx.Identifier() == nil {
		name = ""
	} else {
		name = ctx.Identifier().GetText()
	}

	var storage string
	if ctx.StorageLocation() != nil {
		storage = ctx.StorageLocation().GetText()
	}

	var lastParameter *ParameterDefinition
	if s.IsInReturnParameter {
		lastParameter = s.LastReturn()
	} else if s.IsInCustomError {
		lastParameter = s.LastCustomErrorParameter()
	} else {
		lastParameter = s.LastFunctionParameter()
	}

	lastParameter.Name = name
	lastParameter.Type = typeStr
	lastParameter.Storage = storage

}

func (s *SourceUnitListener) EnterEventParameter(ctx *parser.EventParameterContext) {
	parameter := ParameterDefinition{
		Id: uuid.NewString(),
	}
	lastEvent := s.LastEventDefinition()
	lastEvent.Parameters = append(lastEvent.Parameters, parameter)

}

func (s *SourceUnitListener) ExitEventParameter(ctx *parser.EventParameterContext) {
	typeStr := ctx.TypeName().GetText()

	var name string
	if ctx.Identifier() == nil {
		name = ""
	} else {
		name = ctx.Identifier().GetText()
	}

	lastParameter := s.LastEventParameter()

	lastParameter.Name = name
	lastParameter.Type = typeStr

	if s.IsInEventDefinition {
		isIndexed := ctx.IndexedKeyword() != nil
		lastParameter.IsIndexed = isIndexed
	}
}

func (pd *ParameterDefinition) GetCodeAsString() string {
	if pd.IsIndexed {
		return fmt.Sprintf(parameterTemplateIndexed, pd.Type, pd.Storage, pd.Name)
	} else {
		return fmt.Sprintf(parameterTemplate, pd.Type, pd.Storage, pd.Name)
	}

}

const (
	parameterTemplate        = `%s %s %s`
	parameterTemplateIndexed = `%s indexed %s %s`
)
