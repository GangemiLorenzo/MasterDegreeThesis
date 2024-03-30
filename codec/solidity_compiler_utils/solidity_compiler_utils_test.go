package solidity_compiler_utils

import (
	"log"
	"testing"

	//solidity_parser "codec/solidity_parser"
	contracts "codec/contracts_files_utils"
)

func TestCompiler(t *testing.T) {

	files := []contracts.FileIdentifier{
		contracts.File01UdataUtypes,
		contracts.File02Uconstructors,
		contracts.File03Uvariables,
	}

	//parser := solidity_parser.NewSolidityParser()
	solidityCompilerUtils := NewSolidityCompilerUtils("../tools/solc")
	contractUtils := contracts.NewContractUtils("../internal/contracts/files")

	for _, file := range files {
		contractCode, err := contractUtils.GetCodeAsString(file)
		if err != nil {
			log.Fatalf("failed to read contract file: %v", err)
		}

		err = solidityCompilerUtils.CheckValidity(contractCode)
		if err != nil {
			log.Fatalf("failed to build the contract: %v", err)
		}
	}

}
