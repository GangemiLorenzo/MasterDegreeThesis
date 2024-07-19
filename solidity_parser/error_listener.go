package solidity_parser

import (
	"fmt"

	antlr "github.com/antlr4-go/antlr/v4"
)

type ErrorListener struct {
	*antlr.DefaultErrorListener
	errors []error
}

func NewErrorListener() *ErrorListener {
	return &ErrorListener{
		errors: []error{},
	}
}

func (el *ErrorListener) SyntaxError(recognizer antlr.Recognizer, offendingSymbol interface{}, line, column int, msg string, e antlr.RecognitionException) {
	el.errors = append(el.errors, fmt.Errorf("line %d:%d %s", line, column, msg))
}

func (el *ErrorListener) HasErrors() bool {
	return len(el.errors) > 0
}

func (el *ErrorListener) Errors() []error {
	return el.errors
}
