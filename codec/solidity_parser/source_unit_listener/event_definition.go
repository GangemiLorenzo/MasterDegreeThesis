package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type EventDefinition struct {
	Id         string                `json:"id"`
	Name       string                `json:"name"`
	Parameters []ParameterDefinition `json:"parameters"`
}

func (s *SourceUnitListener) EnterEventDefinition(ctx *parser.EventDefinitionContext) {
	s.IsInEventDefinition = true

	event := EventDefinition{
		Id: uuid.NewString(),
	}
	if s.IsInContract {
		lastContract := s.LastContract()
		lastContract.Events = append(lastContract.Events, event)
	} else {
		s.SourceUnit.Events = append(s.SourceUnit.Events, event)
	}

	fmt.Println("Enter Event Definition")
}

func (s *SourceUnitListener) ExitEventDefinition(ctx *parser.EventDefinitionContext) {

	name := ctx.Identifier().GetText()
	lastEvent := s.LastEventDefinition()
	lastEvent.Name = name

	s.IsInEventDefinition = false
	fmt.Println("Exit Event Definition")
}
