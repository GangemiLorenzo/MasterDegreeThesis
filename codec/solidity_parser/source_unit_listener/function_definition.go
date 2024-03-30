package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"

	"github.com/google/uuid"
)

type FunctionDefinition struct {
	Id              string                `json:"id"`
	Name            string                `json:"name"`
	Parameters      []ParameterDefinition `json:"parameters"`
	Returns         []ParameterDefinition `json:"returns"`
	Visibility      string                `json:"visibility"`
	Body            string                `json:"body"`
	StateMutability string                `json:"stateMutability"`
	Modifiers       []string              `json:"modifiers"`
}

func (s *SourceUnitListener) EnterFunctionDefinition(ctx *parser.FunctionDefinitionContext) {
	s.IsInFunctionDefinition = true

	function := FunctionDefinition{
		Id: uuid.NewString(),
	}
	if s.IsInContract {
		lastContract := s.LastContract()
		lastContract.Functions = append(lastContract.Functions, function)
	} else {
		s.SourceUnit.Functions = append(s.SourceUnit.Functions, function)
	}

}

func (s *SourceUnitListener) ExitFunctionDefinition(ctx *parser.FunctionDefinitionContext) {

	s.IsInFunctionDefinition = false

}

func (s *SourceUnitListener) EnterFunctionDescriptor(ctx *parser.FunctionDescriptorContext) {

}

func (s *SourceUnitListener) ExitFunctionDescriptor(ctx *parser.FunctionDescriptorContext) {
	var name string
	if ctx.ConstructorKeyword() != nil {
		name = "constructor"
	} else if ctx.FallbackKeyword() != nil {
		name = "fallback"
	} else if ctx.ReceiveKeyword() != nil {
		name = "receive"
	} else {
		name = ctx.Identifier().GetText()
	}

	lastFunction := s.LastFunctionDefinition()
	lastFunction.Name = name

}
