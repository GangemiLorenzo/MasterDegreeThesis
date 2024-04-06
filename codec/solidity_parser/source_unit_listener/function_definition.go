package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"
	"strings"

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
	IsConstructor   bool                  `json:"isConstructor"`
	IsFallback      bool                  `json:"isFallback"`
	IsReceive       bool                  `json:"isReceive"`
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
	lastFunction := s.LastFunctionDefinition()

	var name string
	if ctx.ConstructorKeyword() != nil {
		name = ""
		lastFunction.IsConstructor = true
	} else if ctx.FallbackKeyword() != nil {
		name = ""
		lastFunction.IsFallback = true
	} else if ctx.ReceiveKeyword() != nil {
		name = ""
		lastFunction.IsReceive = true
	} else {
		name = ctx.Identifier().GetText()
	}

	lastFunction.Name = name
}

func (fd *FunctionDefinition) GetCodeAsString() string {
	var parameterStrings []string
	for _, p := range fd.Parameters {
		parameterStrings = append(parameterStrings, p.GetCodeAsString())
	}
	combinedParameters := strings.Join(parameterStrings, ", ")

	var returnStrings []string
	for _, p := range fd.Returns {
		returnStrings = append(returnStrings, p.GetCodeAsString())
	}
	combinedReturns := strings.Join(returnStrings, ", ")

	combinedModifiers := strings.Join(fd.Modifiers, " ")

	// Handle interfaces
	body := fd.Body
	if body == "" {
		body = ";"
	}

	if fd.IsConstructor {
		return fmt.Sprintf(constructorTemplate, combinedParameters, combinedModifiers, body)
	}

	var functionType string
	if fd.IsFallback {
		functionType = `fallback`
	} else if fd.IsReceive {
		functionType = `receive`
	} else {
		functionType = `function`
	}

	if len(fd.Returns) > 0 {
		return fmt.Sprintf(functionTemplateWithReturns, functionType, fd.Name, combinedParameters, combinedModifiers, fd.StateMutability, combinedReturns, body)
	}

	return fmt.Sprintf(functionTemplate, functionType, fd.Name, combinedParameters, combinedModifiers, fd.StateMutability, body)

}

func (s *SourceUnitListener) EnterStateMutability(ctx *parser.StateMutabilityContext) {

}

func (s *SourceUnitListener) ExitStateMutability(ctx *parser.StateMutabilityContext) {
	if s.IsInFunctionDefinition {
		lastFunction := s.LastFunctionDefinition()
		lastFunction.StateMutability = ctx.GetText()
	}
}

const (
	functionTemplate = `%s %s(%s) %s %s
	%s

	`
	functionTemplateWithReturns = `%s %s(%s) %s %s returns (%s)
	%s

	`
	constructorTemplate = `constructor(%s) %s
	%s
	
	`
)
