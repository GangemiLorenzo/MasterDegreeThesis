package solidity

import (
	"fmt"
	"os/exec"
	"strings"
)

// SolidityCompilerUtils provides utility functions for Solidity compilation and AST generation.
type SolidityCompilerUtils struct {
	CompilerPath string
}

// NewSolidityCompilerUtils creates a new instance of SolidityCompilerUtils with the provided compiler path.
func NewSolidityCompilerUtils(compilerPath string) *SolidityCompilerUtils {
	return &SolidityCompilerUtils{CompilerPath: compilerPath}
}

// CheckValidityAndGenerateAST runs the Solidity compiler to check code validity and generates the AST.
func (scu *SolidityCompilerUtils) CheckValidityAndGenerateAST(code string) (string, error) {
	cmd := exec.Command(scu.CompilerPath, "--ast-json")
	cmd.Stdin = strings.NewReader(code)

	out, err := cmd.Output()
	if err != nil {
		return "", fmt.Errorf("solidity compiler error: %v", err)
	}

	return string(out), nil
}
