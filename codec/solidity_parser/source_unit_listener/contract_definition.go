package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"
	"strings"

	"github.com/google/uuid"
)

type ContractDefinition struct {
	Id           string                  `json:"id"`
	Name         string                  `json:"name"`
	Variables    []VariableDefinition    `json:"variables"`
	Functions    []FunctionDefinition    `json:"functions"`
	Modifiers    []ModifierDefinition    `json:"modifiers"`
	Events       []EventDefinition       `json:"events"`
	Inheritance  []InheritanceDefinition `json:"inheritance"`
	Enums        []EnumDefinition        `json:"enums"`
	Structs      []StructDefinition      `json:"structs"`
	IsInterface  bool                    `json:"isInterface"`
	IsLibrary    bool                    `json:"isLibrary"`
	CustomErrors []CustomErrorDefinition `json:"errors"`
}

type InheritanceDefinition struct {
	Id     string   `json:"id"`
	Name   string   `json:"name"`
	Values []string `json:"values"`
}

// EnterContractDefinition is called when production contractDefinition is entered.
func (s *SourceUnitListener) EnterContractDefinition(ctx *parser.ContractDefinitionContext) {
	s.IsInContract = true

	contract := ContractDefinition{
		Id: uuid.NewString(),
	}
	s.SourceUnit.Contracts = append(s.SourceUnit.Contracts, contract)

}

// ExitContractDefinition is called when production contractDefinition is exited.
func (s *SourceUnitListener) ExitContractDefinition(ctx *parser.ContractDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastContract := s.LastContract()
	lastContract.Name = name

	if ctx.GetStart().GetText() == "interface" {
		lastContract.IsInterface = true
	}
	if ctx.GetStart().GetText() == "library" {
		lastContract.IsLibrary = true
	}

	s.IsInContract = false

}

// // EnterContractPart is called when production contractPart is entered.
// func (s *SourceUnitListener) EnterContractPart(ctx *parser.ContractPartContext) {
//
// }

// // ExitContractPart is called when production contractPart is exited.
// func (s *SourceUnitListener) ExitContractPart(ctx *parser.ContractPartContext) {
//
// }

func (s *SourceUnitListener) EnterInheritanceSpecifier(ctx *parser.InheritanceSpecifierContext) {
	s.IsInInheritance = true

	inheritance := InheritanceDefinition{
		Id: uuid.NewString(),
	}
	lastContract := s.LastContract()
	lastContract.Inheritance = append(lastContract.Inheritance, inheritance)

}

func (s *SourceUnitListener) ExitInheritanceSpecifier(ctx *parser.InheritanceSpecifierContext) {
	name := ctx.UserDefinedTypeName().GetText()

	lastInheritance := s.LastInheritance()
	lastInheritance.Name = name

	s.IsInInheritance = false
}

func (s *SourceUnitListener) EnterExpression(ctx *parser.ExpressionContext) {

}

func (s *SourceUnitListener) ExitExpression(ctx *parser.ExpressionContext) {

	expression := extractTextWithWhitespace(ctx, ctx.GetParser().GetTokenStream())

	if s.IsInTypeName {
		return
	}

	if s.IsInInheritance {
		lastInheritance := s.LastInheritance()
		lastInheritance.Values = append(lastInheritance.Values, expression)
	}

	if s.IsInStateVariable {
		lastVariable := s.LastStateVariable()
		lastVariable.Value = expression
	}
}

func (cd *ContractDefinition) GetCodeAsString() string {

	var typeString string
	if cd.IsInterface {
		typeString = "interface"
	} else if cd.IsLibrary {
		typeString = "library"
	} else {
		typeString = "contract"
	}

	var inheritanceStrings []string
	for _, i := range cd.Inheritance {
		inheritanceStrings = append(inheritanceStrings, i.GetCodeAsString())
	}
	combinedInheritance := strings.Join(inheritanceStrings, `, `)

	var variableStrings []string
	for _, v := range cd.Variables {
		variableStrings = append(variableStrings, v.GetCodeAsString())
	}
	combinedVariables := strings.Join(variableStrings, `
		`)

	var combinedEvents string
	for _, e := range cd.Events {
		combinedEvents += e.GetCodeAsString() + `	`
	}

	var combinedModifiers string
	for _, m := range cd.Modifiers {
		combinedModifiers += m.GetCodeAsString() + `	`
	}

	var combinedStructs string
	for _, s := range cd.Structs {
		combinedStructs += s.GetCodeAsString() + `	`
	}

	var combinedEnums string
	for _, e := range cd.Enums {
		combinedEnums += e.GetCodeAsString() + `	`
	}

	var combinedFunctions string
	for _, f := range cd.Functions {
		combinedFunctions += f.GetCodeAsString() + `	`
	}

	if len(cd.Inheritance) > 0 {
		return fmt.Sprintf(contractTemplateWithInheritance,
			typeString,
			cd.Name,
			combinedInheritance,
			combinedVariables,
			combinedEvents,
			combinedModifiers,
			combinedStructs,
			combinedEnums,
			combinedFunctions,
		)
	}

	return fmt.Sprintf(contractTemplate,
		typeString,
		cd.Name,
		combinedVariables,
		combinedEvents,
		combinedModifiers,
		combinedStructs,
		combinedEnums,
		combinedFunctions,
	)

}

const (
	contractTemplate = `%s %s {
		%s
		%s
		%s
		%s
		%s
		%s
	}
	
	`

	contractTemplateWithInheritance = `%s %s is %s {
		%s
		%s
		%s
		%s
		%s
		%s
	}

	`
)

func (id *InheritanceDefinition) GetCodeAsString() string {

	if len(id.Values) == 0 {
		return fmt.Sprintf(inheritanceDefinition, id.Name)
	}

	combinedValues := strings.Join(id.Values, ", ")
	return fmt.Sprintf(inheritanceDefinitionWithValues, id.Name, combinedValues)
}

const (
	inheritanceDefinition           = `%s`
	inheritanceDefinitionWithValues = `%s(%s)`
)
