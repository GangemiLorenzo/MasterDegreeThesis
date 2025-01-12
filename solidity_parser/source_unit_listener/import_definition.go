package source_unit_listener

import (
	"fmt"
	parser "solidity_parser/antlr_parser"
	"strings"

	"github.com/google/uuid"
)

type ImportDefinition struct {
	Id          string             `json:"id"`
	Path        string             `json:"path"`
	Symbols     []SymbolDefinition `json:"symbols"`
	Description string             `json:"description"`
}

type SymbolDefinition struct {
	Id          string `json:"id"`
	Name        string `json:"name"`
	Alias       string `json:"alias"`
	Description string `json:"description"`
}

func (s *SourceUnitListener) EnterImportDirective(ctx *parser.ImportDirectiveContext) {
	s.IsInImport = true

	importDeclaration := ImportDefinition{
		Id: uuid.NewString(),
	}
	s.SourceUnit.Imports = append(s.SourceUnit.Imports, importDeclaration)

}

func (s *SourceUnitListener) ExitImportDirective(ctx *parser.ImportDirectiveContext) {
	s.IsInImport = false

}

func (s *SourceUnitListener) EnterImportPath(ctx *parser.ImportPathContext) {

}

func (s *SourceUnitListener) ExitImportPath(ctx *parser.ImportPathContext) {
	path := ctx.GetText()
	lastImport := s.LastImport()
	lastImport.Path = path

}

func (s *SourceUnitListener) EnterImportDeclaration(ctx *parser.ImportDeclarationContext) {
	symbol := SymbolDefinition{
		Id: uuid.NewString(),
	}
	lastImport := s.LastImport()
	lastImport.Symbols = append(lastImport.Symbols, symbol)

}

func (s *SourceUnitListener) ExitImportDeclaration(ctx *parser.ImportDeclarationContext) {

	name := ctx.Identifier(0).GetText()
	var alias string
	if len(ctx.AllIdentifier()) > 1 {
		alias = ctx.Identifier(1).GetText()
	}
	symbol := s.LastSymbol()
	symbol.Name = name
	symbol.Alias = alias

}

func (id *ImportDefinition) GetCodeAsString() string {
	var symbolStrings []string

	for _, s := range id.Symbols {
		symbolStrings = append(symbolStrings, s.GetCodeAsString())
	}

	combinedSymbols := strings.Join(symbolStrings, ", ")

	if len(id.Symbols) > 0 {
		return fmt.Sprintf(importTemplateWithSymbols, combinedSymbols, id.Path)
	} else {
		return fmt.Sprintf(simportTemplateWithoutSymbols, id.Path)
	}

}

const (
	importTemplateWithSymbols = `import {%s} from %s;
	`
	simportTemplateWithoutSymbols = `import %s;
	`
)

func (sd *SymbolDefinition) GetCodeAsString() string {
	if sd.Alias != "" {
		return fmt.Sprintf(symbolTemplateWithAlias, sd.Name, sd.Alias)
	} else {
		return fmt.Sprintf(symbolTemplateWithoutAlias, sd.Name)
	}
}

const (
	symbolTemplateWithAlias    = `%s as %s`
	symbolTemplateWithoutAlias = `%s`
)

func (su *ImportDefinition) GetId() string {
	return su.Id
}

func (su *ImportDefinition) SetDescription(description string) {
	su.Description = description
}

func (su *SymbolDefinition) GetId() string {
	return su.Id
}

func (su *SymbolDefinition) SetDescription(description string) {
	su.Description = description
}

func (su *ImportDefinition) UpdateDescription(id string, description string) {
	if su.Id == id {
		su.SetDescription(description)
	}

	for i := range su.Symbols {
		su.Symbols[i].UpdateDescription(id, description)
	}

}

func (su *SymbolDefinition) UpdateDescription(id string, description string) {
	if su.Id == id {
		su.SetDescription(description)
	}
}
