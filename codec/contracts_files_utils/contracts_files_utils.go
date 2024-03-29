package contracts

import (
	"fmt"
	"os"
	"path/filepath"
)

type FileIdentifier string

// Run ./files.sh to generate this
const (
	File01UdataUtypes              FileIdentifier = "01_data_types"
	File02Uconstructors            FileIdentifier = "02_constructors"
	File03Uvariables               FileIdentifier = "03_variables"
	File04Ufunctions               FileIdentifier = "04_functions"
	File05Uvisibility              FileIdentifier = "05_visibility"
	File06UpureUandUviewUfunctions FileIdentifier = "06_pure_and_view_functions"
	File07UfunctionUmodifiers      FileIdentifier = "07_function_modifiers"
	File09Uevents                  FileIdentifier = "09_events"
	File10UerrorUhandling          FileIdentifier = "10_error_handling"
	File11UfallbackUfunction       FileIdentifier = "11_fallback_function"
	File12UforUloop                FileIdentifier = "12_for_loop"
	File13Uarray                   FileIdentifier = "13_array"
	File14_1Umapping               FileIdentifier = "14_1_mapping"
	File14Umapping                 FileIdentifier = "14_mapping"
	File15Uenum                    FileIdentifier = "15_enum"
	File16Ustruct                  FileIdentifier = "16_struct"
	File17UpayableUmodifier        FileIdentifier = "17_payable_modifier"
	File18_1Uimports               FileIdentifier = "18_1_imports"
	File18Uimports                 FileIdentifier = "18_imports"
	File19UcontractUcleanup        FileIdentifier = "19_contract_cleanup"
	File20UmemoryUandUstorage      FileIdentifier = "20_memory_and_storage"
	File21Uinheritance             FileIdentifier = "21_inheritance"
	File22UifUstatement            FileIdentifier = "22_if_statement"
	File23Ulibraries               FileIdentifier = "23_libraries"
	File24Uinterface               FileIdentifier = "24_interface"
)

type ContractFilesUtils struct {
	FilesPath string
}

// NewContractUtils creates a new instance of ContractFilesUtils with the specified files path.
func NewContractUtils(filesPath string) *ContractFilesUtils {
	return &ContractFilesUtils{FilesPath: filesPath}
}

func (cu *ContractFilesUtils) GetCodeAsString(fileIdentifier FileIdentifier) (string, error) {

	filePath := filepath.Join(cu.FilesPath, string(fileIdentifier)+".sol")

	codeBytes, err := os.ReadFile(filePath)
	if err != nil {
		return "", fmt.Errorf("failed to read file %s: %v", filePath, err)
	}

	code := string(codeBytes)
	return code, nil
}
