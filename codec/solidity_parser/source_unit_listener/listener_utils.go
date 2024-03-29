package source_unit_listener

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

func (s *SourceUnitListener) LastPragmaDirective() *PragmaDirective {
	if len(s.SourceUnit.Pragmas) == 0 {
		return nil
	}

	return &s.SourceUnit.Pragmas[len(s.SourceUnit.Pragmas)-1]
}

func (s *SourceUnitListener) LastImport() *Import {
	if len(s.SourceUnit.Imports) == 0 {
		return nil
	}
	return &s.SourceUnit.Imports[len(s.SourceUnit.Imports)-1]
}

func (s *SourceUnitListener) LastSymbol() *Symbol {
	if len(s.LastImport().Symbols) == 0 {
		return nil
	}
	return &s.LastImport().Symbols[len(s.LastImport().Symbols)-1]
}

func (s *SourceUnitListener) LastContract() *Contract {
	if len(s.SourceUnit.Contracts) == 0 {
		return nil
	}
	return &s.SourceUnit.Contracts[len(s.SourceUnit.Contracts)-1]
}

func (s *SourceUnitListener) LastInheritance() *Inheritance {
	if s.LastContract().Inheritance == nil {
		return nil
	}
	return &s.LastContract().Inheritance[len(s.LastContract().Inheritance)-1]
}

func (s *SourceUnitListener) LastStateVariable() *Variable {
	if len(s.LastContract().Variables) == 0 {
		return nil
	}
	return &s.LastContract().Variables[len(s.LastContract().Variables)-1]
}

func (s *SourceUnitListener) LastFunctionDefinition() *Function {
	if s.IsInContract {
		if len(s.LastContract().Functions) == 0 {
			return nil
		}
		return &s.LastContract().Functions[len(s.LastContract().Functions)-1]
	}

	if len(s.SourceUnit.Functions) == 0 {
		return nil
	}
	return &s.SourceUnit.Functions[len(s.SourceUnit.Functions)-1]
}

func (s *SourceUnitListener) LastCustomError() *CustomError {
	if s.IsInContract {
		if len(s.LastContract().CustomErrors) == 0 {
			return nil
		}
		return &s.LastContract().CustomErrors[len(s.LastContract().CustomErrors)-1]
	}

	if len(s.SourceUnit.CustomErrors) == 0 {
		return nil
	}
	return &s.SourceUnit.CustomErrors[len(s.SourceUnit.CustomErrors)-1]
}

func (s *SourceUnitListener) LastEventDefinition() *Event {
	if s.IsInContract {
		if len(s.LastContract().Events) == 0 {
			return nil
		}
		return &s.LastContract().Events[len(s.LastContract().Events)-1]
	}

	if len(s.SourceUnit.Events) == 0 {
		return nil
	}
	return &s.SourceUnit.Events[len(s.SourceUnit.Events)-1]
}

func (s *SourceUnitListener) LastModifierDefinition() *Modifier {
	if len(s.LastContract().Modifiers) == 0 {
		return nil
	}
	return &s.LastContract().Modifiers[len(s.LastContract().Modifiers)-1]
}

func (s *SourceUnitListener) LastFunctionParameter() *Parameter {
	if len(s.LastFunctionDefinition().Parameters) == 0 {
		return nil
	}
	return &s.LastFunctionDefinition().Parameters[len(s.LastFunctionDefinition().Parameters)-1]
}

func (s *SourceUnitListener) LastCustomErrorParameter() *Parameter {
	if len(s.LastCustomError().Parameters) == 0 {
		return nil
	}
	return &s.LastCustomError().Parameters[len(s.LastCustomError().Parameters)-1]
}

func (s *SourceUnitListener) LastEventParameter() *Parameter {
	if len(s.LastEventDefinition().Parameters) == 0 {
		return nil
	}
	return &s.LastEventDefinition().Parameters[len(s.LastEventDefinition().Parameters)-1]
}

func (s *SourceUnitListener) LastReturn() *Parameter {
	if len(s.LastFunctionDefinition().Returns) == 0 {
		return nil
	}
	return &s.LastFunctionDefinition().Returns[len(s.LastFunctionDefinition().Returns)-1]
}

func (s *SourceUnitListener) LastEnum() *Enum {
	if s.IsInContract {
		if len(s.LastContract().Enums) == 0 {
			return nil
		}
		return &s.LastContract().Enums[len(s.LastContract().Enums)-1]
	}

	if len(s.SourceUnit.Enums) == 0 {
		return nil
	}
	return &s.SourceUnit.Enums[len(s.SourceUnit.Enums)-1]
}

func (s *SourceUnitListener) LastStruct() *Struct {
	if s.IsInContract {
		if len(s.LastContract().Structs) == 0 {
			return nil
		}
		return &s.LastContract().Structs[len(s.LastContract().Structs)-1]
	}

	if len(s.SourceUnit.Structs) == 0 {
		return nil
	}
	return &s.SourceUnit.Structs[len(s.SourceUnit.Structs)-1]
}

func (s *SourceUnitListener) LastStructField() *Variable {
	if len(s.LastStruct().Fields) == 0 {
		return nil
	}
	return &s.LastStruct().Fields[len(s.LastStruct().Fields)-1]
}
