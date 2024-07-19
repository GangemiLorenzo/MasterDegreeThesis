package source_unit_listener

import (
	"fmt"
	parser "solidity_parser/antlr_parser"

	"github.com/google/uuid"
)

type PragmaDirective struct {
	Id          string `json:"id"`
	Name        string `json:"name"`
	Value       string `json:"value"`
	Description string `json:"description"`
}

func (s *SourceUnitListener) EnterPragmaDirective(ctx *parser.PragmaDirectiveContext) {

	pragmaDirective := PragmaDirective{
		Id: uuid.NewString(),
	}
	s.SourceUnit.Pragmas = append(s.SourceUnit.Pragmas, pragmaDirective)
}

func (s *SourceUnitListener) ExitPragmaDirective(ctx *parser.PragmaDirectiveContext) {

}

func (s *SourceUnitListener) EnterPragmaName(ctx *parser.PragmaNameContext) {

}

func (s *SourceUnitListener) ExitPragmaName(ctx *parser.PragmaNameContext) {
	// Inside ExitPragmaName and ExitPragmaValue or similar functions
	lastPragma := s.LastPragmaDirective()
	lastPragma.Name = ctx.GetText()

}

func (s *SourceUnitListener) EnterPragmaValue(ctx *parser.PragmaValueContext) {

}

func (s *SourceUnitListener) ExitPragmaValue(ctx *parser.PragmaValueContext) {
	lastPragma := s.LastPragmaDirective()
	lastPragma.Value = ctx.GetText()

}

func (pd *PragmaDirective) GetCodeAsString() string {

	result := fmt.Sprintf(pragmaTemplate, pd.Name, pd.Value)

	return result
}

// Template used to reconstruct the code from the PragmaDirective
const pragmaTemplate string = `pragma %s %s;
	`

func (su *PragmaDirective) GetId() string {
	return su.Id
}

func (su *PragmaDirective) SetDescription(description string) {
	su.Description = description
}

func (su *PragmaDirective) UpdateDescription(id string, description string) {
	if su.Id == id {
		su.SetDescription(description)
	}
}
