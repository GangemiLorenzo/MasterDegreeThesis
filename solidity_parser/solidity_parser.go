package solidity_parser

import (
	"fmt"
	parser "solidity_parser/antlr_parser"

	listener "solidity_parser/source_unit_listener"

	antlr "github.com/antlr4-go/antlr/v4"
)

type ISolidityParser interface {
	ParseSmartContract(sourceCode string) (*listener.SourceUnit, error)
	GetCodeFromSourceUnit(sourceUnit listener.SourceUnit) (string, error)
}

type SolidityParser struct {
}

func NewSolidityParser() ISolidityParser {
	return &SolidityParser{}
}

func (p *SolidityParser) ParseSmartContract(sourceCode string) (*listener.SourceUnit, error) {
	inputStream := antlr.NewInputStream(sourceCode)
	lexer := parser.NewSolidityLexer(inputStream)
	stream := antlr.NewCommonTokenStream(lexer, antlr.TokenDefaultChannel)
	solidityParser := parser.NewSolidityParser(stream)

	// Add the custom error listener
	errorListener := NewErrorListener()
	solidityParser.RemoveErrorListeners()
	solidityParser.AddErrorListener(errorListener)

	// Add the custom contract listener
	sourceUnitListener := listener.NewSourceUnitListener()
	solidityParser.AddParseListener(sourceUnitListener)

	// Perform the parsing
	solidityParser.SourceUnit()

	if errorListener.HasErrors() {
		return nil, fmt.Errorf("parsing errors: %v", errorListener.Errors())
	}

	res := sourceUnitListener.SourceUnit

	return res, nil
}

func (p *SolidityParser) GetCodeFromSourceUnit(sourceUnit listener.SourceUnit) (string, error) {

	return sourceUnit.GetCodeAsString(), nil
}
