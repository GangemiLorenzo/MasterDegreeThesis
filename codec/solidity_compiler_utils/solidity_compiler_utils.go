package solidity_compiler_utils

import (
	"fmt"
	"os"
	"os/exec"
)

// SolidityCompilerUtils provides utility functions for Solidity compilation and AST generation.
type SolidityCompilerUtils struct {
	CompilerPath string
}

// NewSolidityCompilerUtils creates a new instance of SolidityCompilerUtils with the provided compiler path.
func NewSolidityCompilerUtils(compilerPath string) *SolidityCompilerUtils {
	return &SolidityCompilerUtils{CompilerPath: compilerPath}
}

// CheckValidity runs the Solidity compiler to check code validity
func (scu *SolidityCompilerUtils) CheckValidity(code string) error {
	tempFile, err := os.CreateTemp("", "solidity_code_*.sol")
	if err != nil {
		return fmt.Errorf("failed to create temporary file: %v", err)
	}
	defer os.Remove(tempFile.Name())

	_, err = tempFile.WriteString(code)
	if err != nil {
		return fmt.Errorf("failed to write code to temporary file: %v", err)
	}
	tempFile.Close()

	cmd := exec.Command(scu.CompilerPath, tempFile.Name())
	_, err = cmd.Output()
	if err != nil {
		return fmt.Errorf("solidity code cannot be compiled: %v", err)
	}

	return nil
}
