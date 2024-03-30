package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type ParameterDefinition struct {
	Id      string `json:"id"`
	Name    string `json:"name"`
	Type    string `json:"type"`
	Storage string `json:"storage"`
}

func (s *SourceUnitListener) EnterReturnParameters(ctx *parser.ReturnParametersContext) {
	s.IsInReturnParameter = true
	fmt.Println("Enter Return Parameters")
}

func (s *SourceUnitListener) ExitReturnParameters(ctx *parser.ReturnParametersContext) {
	s.IsInReturnParameter = false
	fmt.Println("Exit Return Parameters")
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

	fmt.Println("Enter Parameter")
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

	fmt.Println("Exit Parameter")
}

func (s *SourceUnitListener) EnterEventParameter(ctx *parser.EventParameterContext) {
	parameter := ParameterDefinition{
		Id: uuid.NewString(),
	}
	lastEvent := s.LastEventDefinition()
	lastEvent.Parameters = append(lastEvent.Parameters, parameter)

	fmt.Println("Enter Event Parameter")
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
	fmt.Println("Exit Event Parameter")
}
