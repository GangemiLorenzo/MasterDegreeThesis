package source_unit_listener

import (
	"fmt"
	parser "solidity_parser/antlr_parser"
	"strings"

	"github.com/google/uuid"
)

type EventDefinition struct {
	Id          string                `json:"id"`
	Name        string                `json:"name"`
	Parameters  []ParameterDefinition `json:"parameters"`
	Description string                `json:"description"`
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

}

func (s *SourceUnitListener) ExitEventDefinition(ctx *parser.EventDefinitionContext) {

	name := ctx.Identifier().GetText()
	lastEvent := s.LastEventDefinition()
	lastEvent.Name = name

	s.IsInEventDefinition = false

}

func (ed *EventDefinition) GetCodeAsString() string {
	var parameterStrings []string

	for _, p := range ed.Parameters {
		parameterStrings = append(parameterStrings, p.GetCodeAsString())
	}

	combinedParameters := strings.Join(parameterStrings, ", ")

	return fmt.Sprintf(eventTemplate, ed.Name, combinedParameters)

}

const eventTemplate = `event %s(%s);
	`

func (su *EventDefinition) GetId() string {
	return su.Id
}

func (su *EventDefinition) SetDescription(description string) {
	su.Description = description
}

func (su *EventDefinition) UpdateDescription(id string, description string) {
	if su.Id == id {
		su.SetDescription(description)
	}

	for i := range su.Parameters {
		su.Parameters[i].UpdateDescription(id, description)

	}

}
