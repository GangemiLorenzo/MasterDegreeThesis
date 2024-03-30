package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type ImportDefinition struct {
	Id      string             `json:"id"`
	Path    string             `json:"path"`
	Symbols []SymbolDefinition `json:"symbols"`
}

type SymbolDefinition struct {
	Id    string `json:"id"`
	Name  string `json:"name"`
	Alias string `json:"alias"`
}

func (s *SourceUnitListener) EnterImportDirective(ctx *parser.ImportDirectiveContext) {
	s.IsInImport = true

	importDeclaration := ImportDefinition{
		Id: uuid.NewString(),
	}
	s.SourceUnit.Imports = append(s.SourceUnit.Imports, importDeclaration)

	fmt.Println("Enter Import Directive")
}

func (s *SourceUnitListener) ExitImportDirective(ctx *parser.ImportDirectiveContext) {
	s.IsInImport = false

	fmt.Println("Exit Import Directive")
}

func (s *SourceUnitListener) EnterImportPath(ctx *parser.ImportPathContext) {
	fmt.Println("Enter Import Path")
}

func (s *SourceUnitListener) ExitImportPath(ctx *parser.ImportPathContext) {
	path := ctx.GetText()
	lastImport := s.LastImport()
	lastImport.Path = path

	fmt.Println("Exit Import Path")
}

func (s *SourceUnitListener) EnterImportDeclaration(ctx *parser.ImportDeclarationContext) {
	symbol := SymbolDefinition{
		Id: uuid.NewString(),
	}
	lastImport := s.LastImport()
	lastImport.Symbols = append(lastImport.Symbols, symbol)

	fmt.Println("Enter Import Declaration")
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

	fmt.Println("Exit Import Declaration")
}
