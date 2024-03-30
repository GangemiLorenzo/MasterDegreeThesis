package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type PragmaDirective struct {
	Id    string `json:"id"`
	Name  string `json:"name"`
	Value string `json:"value"`
}

func (s *SourceUnitListener) EnterPragmaDirective(ctx *parser.PragmaDirectiveContext) {
	fmt.Println("Enter pragma directive")

	pragmaDirective := PragmaDirective{
		Id: uuid.NewString(),
	}
	s.SourceUnit.Pragmas = append(s.SourceUnit.Pragmas, pragmaDirective)
}

func (s *SourceUnitListener) ExitPragmaDirective(ctx *parser.PragmaDirectiveContext) {
	fmt.Println("Exit pragma directive")
}

func (s *SourceUnitListener) EnterPragmaName(ctx *parser.PragmaNameContext) {
	fmt.Println("Enter Pragma Name")
}

func (s *SourceUnitListener) ExitPragmaName(ctx *parser.PragmaNameContext) {
	// Inside ExitPragmaName and ExitPragmaValue or similar functions
	lastPragma := s.LastPragmaDirective()
	lastPragma.Name = ctx.GetText()

	fmt.Println("Exit Pragma Name")
}

func (s *SourceUnitListener) EnterPragmaValue(ctx *parser.PragmaValueContext) {
	fmt.Println("Enter Pragma Value")
}

func (s *SourceUnitListener) ExitPragmaValue(ctx *parser.PragmaValueContext) {
	lastPragma := s.LastPragmaDirective()
	lastPragma.Value = ctx.GetText()

	fmt.Println("Exit Pragma Value")
}
