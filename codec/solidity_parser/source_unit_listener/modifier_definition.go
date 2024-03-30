package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type ModifierDefinition struct {
	Id   string `json:"id"`
	Name string `json:"name"`
	Body string `json:"body"`
}

func (s *SourceUnitListener) EnterModifierDefinition(ctx *parser.ModifierDefinitionContext) {
	s.IsInModifierDefinition = true
	modifier := ModifierDefinition{
		Id: uuid.NewString(),
	}
	lastContract := s.LastContract()
	lastContract.Modifiers = append(lastContract.Modifiers, modifier)
	fmt.Println("Enter Modifier Definition")
}

func (s *SourceUnitListener) ExitModifierDefinition(ctx *parser.ModifierDefinitionContext) {

	name := ctx.Identifier().GetText()
	lastModifier := s.LastModifierDefinition()
	lastModifier.Name = name

	s.IsInModifierDefinition = false
	fmt.Println("Exit Modifier Definition")
}

func (s *SourceUnitListener) EnterModifierList(ctx *parser.ModifierListContext) {
	fmt.Println("Enter Modifier List")
}

func (s *SourceUnitListener) ExitModifierList(ctx *parser.ModifierListContext) {

	lastFunction := s.LastFunctionDefinition()

	// Collect all modifiers
	var modifiers []string
	if len(ctx.AllExternalKeyword()) > 0 {
		modifiers = append(modifiers, "external")
	}
	if len(ctx.AllPublicKeyword()) > 0 {
		modifiers = append(modifiers, "public")
	}
	if len(ctx.AllInternalKeyword()) > 0 {
		modifiers = append(modifiers, "internal")
	}
	if len(ctx.AllPrivateKeyword()) > 0 {
		modifiers = append(modifiers, "private")
	}
	if len(ctx.AllModifierInvocation()) > 0 {
		for _, mod := range ctx.AllModifierInvocation() {
			modifiers = append(modifiers, mod.GetText())
		}
	}
	if len(ctx.AllOverrideSpecifier()) > 0 {
		modifiers = append(modifiers, "override")
	}
	lastFunction.Modifiers = modifiers

	for _, mod := range modifiers {
		switch mod {
		case "public", "private", "internal":
			lastFunction.Visibility = mod
			break
		}
	}

	// Check for state mutability
	if len(ctx.AllStateMutability()) > 0 {
		lastFunction.StateMutability = ctx.StateMutability(0).GetText()
	}

	fmt.Println("Exit Modifier List")
}
