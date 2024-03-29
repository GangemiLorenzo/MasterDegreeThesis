package solidity_parser

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	listener "codec/solidity_parser/source_unit_listener"

	antlr "github.com/antlr4-go/antlr/v4"
)

type SolidityParserInterface interface {
	GetParseTree(sourceCode string) (string, error)
	ParseSmartContract(sourceCode string) (*listener.SourceUnit, error)
}

type SolidityParser struct {
}

func NewSolidityParser() SolidityParserInterface {
	return &SolidityParser{}
}

func (p *SolidityParser) GetParseTree(sourceCode string) (string, error) {
	inputStream := antlr.NewInputStream(sourceCode)
	lexer := parser.NewSolidityLexer(inputStream)
	stream := antlr.NewCommonTokenStream(lexer, antlr.TokenDefaultChannel)
	solidityParser := parser.NewSolidityParser(stream)

	// Add the custom error listener
	errorListener := NewErrorListener()
	solidityParser.RemoveErrorListeners()
	solidityParser.AddErrorListener(errorListener)

	parseTree := solidityParser.SourceUnit()

	if errorListener.HasErrors() {
		return "", fmt.Errorf("parsing errors: %v", errorListener.Errors())
	}

	return parseTree.ToStringTree(nil, solidityParser), nil
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
