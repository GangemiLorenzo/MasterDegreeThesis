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
			text := token.GetText()
			if !strings.HasPrefix(text, "//") && !strings.HasPrefix(text, "/*") {
				textBuilder.WriteString(text + " ")
			}
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

func (s *SourceUnitListener) LastImport() *ImportDefinition {
	if len(s.SourceUnit.Imports) == 0 {
		return nil
	}
	return &s.SourceUnit.Imports[len(s.SourceUnit.Imports)-1]
}

func (s *SourceUnitListener) LastSymbol() *SymbolDefinition {
	if len(s.LastImport().Symbols) == 0 {
		return nil
	}
	return &s.LastImport().Symbols[len(s.LastImport().Symbols)-1]
}

func (s *SourceUnitListener) LastContract() *ContractDefinition {
	if len(s.SourceUnit.Contracts) == 0 {
		return nil
	}
	return &s.SourceUnit.Contracts[len(s.SourceUnit.Contracts)-1]
}

func (s *SourceUnitListener) LastInheritance() *InheritanceDefinition {
	if s.LastContract().Inheritance == nil {
		return nil
	}
	return &s.LastContract().Inheritance[len(s.LastContract().Inheritance)-1]
}

func (s *SourceUnitListener) LastStateVariable() *VariableDefinition {
	if len(s.LastContract().Variables) == 0 {
		return nil
	}
	return &s.LastContract().Variables[len(s.LastContract().Variables)-1]
}

func (s *SourceUnitListener) LastFunctionDefinition() *FunctionDefinition {
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

func (s *SourceUnitListener) LastCustomError() *CustomErrorDefinition {
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

func (s *SourceUnitListener) LastEventDefinition() *EventDefinition {
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

func (s *SourceUnitListener) LastModifierDefinition() *ModifierDefinition {
	if len(s.LastContract().Modifiers) == 0 {
		return nil
	}
	return &s.LastContract().Modifiers[len(s.LastContract().Modifiers)-1]
}

func (s *SourceUnitListener) LastModifierParameter() *ParameterDefinition {
	if len(s.LastModifierDefinition().Parameters) == 0 {
		return nil
	}
	return &s.LastModifierDefinition().Parameters[len(s.LastModifierDefinition().Parameters)-1]
}

func (s *SourceUnitListener) LastFunctionParameter() *ParameterDefinition {
	if len(s.LastFunctionDefinition().Parameters) == 0 {
		return nil
	}
	return &s.LastFunctionDefinition().Parameters[len(s.LastFunctionDefinition().Parameters)-1]
}

func (s *SourceUnitListener) LastCustomErrorParameter() *ParameterDefinition {
	if len(s.LastCustomError().Parameters) == 0 {
		return nil
	}
	return &s.LastCustomError().Parameters[len(s.LastCustomError().Parameters)-1]
}

func (s *SourceUnitListener) LastEventParameter() *ParameterDefinition {
	if len(s.LastEventDefinition().Parameters) == 0 {
		return nil
	}
	return &s.LastEventDefinition().Parameters[len(s.LastEventDefinition().Parameters)-1]
}

func (s *SourceUnitListener) LastReturn() *ParameterDefinition {
	if len(s.LastFunctionDefinition().Returns) == 0 {
		return nil
	}
	return &s.LastFunctionDefinition().Returns[len(s.LastFunctionDefinition().Returns)-1]
}

func (s *SourceUnitListener) LastEnum() *EnumDefinition {
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

func (s *SourceUnitListener) LastStruct() *StructDefinition {
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

func (s *SourceUnitListener) LastStructField() *VariableDefinition {
	if len(s.LastStruct().Fields) == 0 {
		return nil
	}
	return &s.LastStruct().Fields[len(s.LastStruct().Fields)-1]
}
