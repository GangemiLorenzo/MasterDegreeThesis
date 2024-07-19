package source_unit_listener

import (
	"fmt"
	parser "solidity_parser/antlr_parser"

	"github.com/google/uuid"
)

type ParameterDefinition struct {
	Id          string `json:"id"`
	Name        string `json:"name"`
	Type        string `json:"type"`
	Storage     string `json:"storage"`
	IsIndexed   bool   `json:"isIndexed"`
	IsPayable   bool   `json:"payable"`
	Description string `json:"description"`
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

	if s.IsInModifierDefinition {
		lastModifier := s.LastModifierDefinition()
		lastModifier.Parameters = append(lastModifier.Parameters, parameter)
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
	payable := false
	if typeStr == "addresspayable" {
		payable = true
		typeStr = "address"
	}

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
	} else if s.IsInModifierDefinition {
		lastParameter = s.LastModifierParameter()
	} else {
		lastParameter = s.LastFunctionParameter()
	}

	lastParameter.Name = name
	lastParameter.Type = typeStr
	lastParameter.IsPayable = payable
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
	payable := false
	if typeStr == "addresspayable" {
		payable = true
		typeStr = "address"
	}

	var name string
	if ctx.Identifier() == nil {
		name = ""
	} else {
		name = ctx.Identifier().GetText()
	}

	lastParameter := s.LastEventParameter()

	lastParameter.Name = name
	lastParameter.Type = typeStr
	lastParameter.IsPayable = payable

	if s.IsInEventDefinition {
		isIndexed := ctx.IndexedKeyword() != nil
		lastParameter.IsIndexed = isIndexed
	}
}

func (pd *ParameterDefinition) GetCodeAsString() string {
	indexed := ""
	payable := ""
	if pd.IsIndexed {
		indexed = "indexed"
	}
	if pd.IsPayable {
		payable = "payable"
	}

	return fmt.Sprintf(parameterTemplate, pd.Type, indexed, payable, pd.Storage, pd.Name)
}

const (
	parameterTemplate = `%s %s %s %s %s`
)

func (su *ParameterDefinition) GetId() string {
	return su.Id
}

func (su *ParameterDefinition) SetDescription(description string) {
	su.Description = description
}

func (su *ParameterDefinition) UpdateDescription(id string, description string) {
	if su.Id == id {
		su.SetDescription(description)
	}

}
