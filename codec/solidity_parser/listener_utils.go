package solidity_parser

import (
	"strings"

	antlr "github.com/antlr4-go/antlr/v4"
)

func extractTextWithWhitespace(ctx antlr.ParserRuleContext, tokens antlr.TokenStream) string {
	start, stop := ctx.GetStart(), ctx.GetStop()
	if start != nil && stop != nil && start.GetTokenIndex() <= stop.GetTokenIndex() {
		// Build the text from the tokens, including skipped ones like whitespace
		var textBuilder strings.Builder
		for i := start.GetTokenIndex(); i <= stop.GetTokenIndex(); i++ {
			token := tokens.Get(i)
			textBuilder.WriteString(token.GetText() + " ")
		}
		return textBuilder.String()
	}
	return ""
}

func (s *SourceUnitListener) LastContract() *Contract {
	if len(s.SourceUnit.Contracts) == 0 {
		return nil
	}
	return s.SourceUnit.Contracts[len(s.SourceUnit.Contracts)-1]
}

func (s *SourceUnitListener) LastStateVariable() *Variable {
	if len(s.LastContract().Variables) == 0 {
		return nil
	}
	return &s.LastContract().Variables[len(s.LastContract().Variables)-1]
}

func (s *SourceUnitListener) LastFunctionDefinition() *Function {
	if len(s.LastContract().Functions) == 0 {
		return nil
	}
	return &s.LastContract().Functions[len(s.LastContract().Functions)-1]
}

func (s *SourceUnitListener) LastModifierDefinition() *Modifier {
	if len(s.LastContract().Modifiers) == 0 {
		return nil
	}
	return &s.LastContract().Modifiers[len(s.LastContract().Modifiers)-1]
}

func (s *SourceUnitListener) LastParameter() *Parameter {
	if len(s.LastFunctionDefinition().Parameters) == 0 {
		return nil
	}
	return &s.LastFunctionDefinition().Parameters[len(s.LastFunctionDefinition().Parameters)-1]
}

func (s *SourceUnitListener) LastReturn() *Parameter {
	if len(s.LastFunctionDefinition().Returns) == 0 {
		return nil
	}
	return &s.LastFunctionDefinition().Returns[len(s.LastFunctionDefinition().Returns)-1]
}
