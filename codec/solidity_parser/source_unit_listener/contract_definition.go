package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"

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
	Id   string `json:"id"`
	Name string `json:"name"`
	Body string `json:"body"`
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
	inheritance := InheritanceDefinition{
		Id: uuid.NewString(),
	}
	lastContract := s.LastContract()
	lastContract.Inheritance = append(lastContract.Inheritance, inheritance)

}

func (s *SourceUnitListener) ExitInheritanceSpecifier(ctx *parser.InheritanceSpecifierContext) {
	name := ctx.UserDefinedTypeName().GetText()
	body := ctx.GetText()

	lastInheritance := s.LastInheritance()
	lastInheritance.Name = name
	lastInheritance.Body = body

}
