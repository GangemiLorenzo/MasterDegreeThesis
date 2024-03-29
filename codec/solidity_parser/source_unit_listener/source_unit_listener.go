package source_unit_listener

import (
	parser "codec/solidity_parser/antlr_parser"
	"fmt"

	"github.com/google/uuid"
)

type SourceUnitListener struct {
	*parser.BaseSolidityListener
	SourceUnit             *SourceUnit
	IsInContract           bool
	IsInReturnParameter    bool
	IsInFunctionDefinition bool
	IsInModifierDefinition bool
	IsInEventDefinition    bool
	IsInStruct             bool
	IsInImport             bool
	IsInCustomError        bool
}

func NewSourceUnitListener() *SourceUnitListener {
	return &SourceUnitListener{
		SourceUnit:          &SourceUnit{},
		IsInReturnParameter: false, // Flag to indicate if we are parsing return parameters

	}
}

// EnterSourceUnit is called when production sourceUnit is entered.
func (s *SourceUnitListener) EnterSourceUnit(ctx *parser.SourceUnitContext) {
	fmt.Println("Enter source unit")

	sourceUnit := &SourceUnit{
		Id: uuid.NewString(),
	}
	s.SourceUnit = sourceUnit
}

// ExitSourceUnit is called when production sourceUnit is exited.
func (s *SourceUnitListener) ExitSourceUnit(ctx *parser.SourceUnitContext) {
	fmt.Println("Exit source unit")
}

// EnterPragmaDirective is called when production pragmaDirective is entered.
func (s *SourceUnitListener) EnterPragmaDirective(ctx *parser.PragmaDirectiveContext) {
	fmt.Println("Enter pragma directive")

	pragmaDirective := PragmaDirective{
		Id: uuid.NewString(),
	}
	s.SourceUnit.Pragmas = append(s.SourceUnit.Pragmas, pragmaDirective)
}

// ExitPragmaDirective is called when production pragmaDirective is exited.
func (s *SourceUnitListener) ExitPragmaDirective(ctx *parser.PragmaDirectiveContext) {
	fmt.Println("Exit pragma directive")
}

// EnterPragmaName is called when production pragmaName is entered.
func (s *SourceUnitListener) EnterPragmaName(ctx *parser.PragmaNameContext) {
	fmt.Println("Enter Pragma Name")
}

// ExitPragmaName is called when production pragmaName is exited.
func (s *SourceUnitListener) ExitPragmaName(ctx *parser.PragmaNameContext) {
	// Inside ExitPragmaName and ExitPragmaValue or similar functions
	lastPragma := s.LastPragmaDirective()
	lastPragma.Name = ctx.GetText()

	fmt.Println("Exit Pragma Name")
}

// EnterPragmaValue is called when production pragmaValue is entered.
func (s *SourceUnitListener) EnterPragmaValue(ctx *parser.PragmaValueContext) {
	fmt.Println("Enter Pragma Value")
}

// ExitPragmaValue is called when production pragmaValue is exited.
func (s *SourceUnitListener) ExitPragmaValue(ctx *parser.PragmaValueContext) {
	lastPragma := s.LastPragmaDirective()
	lastPragma.Value = ctx.GetText()

	fmt.Println("Exit Pragma Value")
}

/*
// EnterVersion is called when production version is entered.
func (s *SourceUnitListener) EnterVersion(ctx *parser.VersionContext) {
	fmt.Println("Enter Version")
}

// ExitVersion is called when production version is exited.
func (s *SourceUnitListener) ExitVersion(ctx *parser.VersionContext) {
	version := ctx.GetText()
	fmt.Println("Exit Version: ", version)
}

// EnterVersionOperator is called when production versionOperator is entered.
func (s *SourceUnitListener) EnterVersionOperator(ctx *parser.VersionOperatorContext) {
	fmt.Println("Enter Version Operator")
}

// ExitVersionOperator is called when production versionOperator is exited.
func (s *SourceUnitListener) ExitVersionOperator(ctx *parser.VersionOperatorContext) {
	versionOperator := ctx.GetText()
	fmt.Println("Exit Version Operator: ", versionOperator)
}

// EnterVersionConstraint is called when production versionConstraint is entered.
func (s *SourceUnitListener) EnterVersionConstraint(ctx *parser.VersionConstraintContext) {
	fmt.Println("Enter Version Constraint")
}

// ExitVersionConstraint is called when production versionConstraint is exited.
func (s *SourceUnitListener) ExitVersionConstraint(ctx *parser.VersionConstraintContext) {
	versionConstraint := ctx.GetText()
	fmt.Println("Exit Version Constraint: ", versionConstraint)
}
*/

// EnterImportDeclaration is called when production importDeclaration is entered.
func (s *SourceUnitListener) EnterImportDeclaration(ctx *parser.ImportDeclarationContext) {
	symbol := Symbol{
		Id: uuid.NewString(),
	}
	lastImport := s.LastImport()
	lastImport.Symbols = append(lastImport.Symbols, symbol)

	fmt.Println("Enter Import Declaration")
}

// ExitImportDeclaration is called when production importDeclaration is exited.
func (s *SourceUnitListener) ExitImportDeclaration(ctx *parser.ImportDeclarationContext) {

	name := ctx.Identifier(0).GetText()
	var alias string
	if len(ctx.AllIdentifier()) > 1 {
		alias = ctx.Identifier(1).GetText()
	}
	symbol := s.LastSymbol()
	symbol.Name = name
	symbol.Alias = alias

	fmt.Println("Exit Import Declaration")
}

// EnterImportDirective is called when production importDirective is entered.
func (s *SourceUnitListener) EnterImportDirective(ctx *parser.ImportDirectiveContext) {
	s.IsInImport = true

	importDeclaration := Import{
		Id: uuid.NewString(),
	}
	s.SourceUnit.Imports = append(s.SourceUnit.Imports, importDeclaration)

	fmt.Println("Enter Import Directive")
}

// ExitImportDirective is called when production importDirective is exited.
func (s *SourceUnitListener) ExitImportDirective(ctx *parser.ImportDirectiveContext) {
	s.IsInImport = false

	fmt.Println("Exit Import Directive")
}

// EnterImportPath is called when production importPath is entered.
func (s *SourceUnitListener) EnterImportPath(ctx *parser.ImportPathContext) {
	fmt.Println("Enter Import Path")
}

// ExitImportPath is called when production importPath is exited.
func (s *SourceUnitListener) ExitImportPath(ctx *parser.ImportPathContext) {
	path := ctx.GetText()
	lastImport := s.LastImport()
	lastImport.Path = path

	fmt.Println("Exit Import Path")
}

// EnterContractDefinition is called when production contractDefinition is entered.
func (s *SourceUnitListener) EnterContractDefinition(ctx *parser.ContractDefinitionContext) {
	s.IsInContract = true

	contract := Contract{
		Id: uuid.NewString(),
	}
	s.SourceUnit.Contracts = append(s.SourceUnit.Contracts, contract)

	fmt.Println("Enter Contract Definition")
}

// ExitContractDefinition is called when production contractDefinition is exited.
func (s *SourceUnitListener) ExitContractDefinition(ctx *parser.ContractDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastContract := s.LastContract()
	lastContract.Name = name

	if ctx.GetStart().GetText() == "interface" {
		lastContract.IsInterface = true
	}
	if ctx.GetStart().GetText() == "library" {
		lastContract.IsLibrary = true
	}

	s.IsInContract = false
	fmt.Println("Exit Contract Definition")
}

// EnterInheritanceSpecifier is called when production inheritanceSpecifier is entered.
func (s *SourceUnitListener) EnterInheritanceSpecifier(ctx *parser.InheritanceSpecifierContext) {
	inheritance := Inheritance{
		Id: uuid.NewString(),
	}
	lastContract := s.LastContract()
	lastContract.Inheritance = append(lastContract.Inheritance, inheritance)
	fmt.Println("Enter Inheritance Specifier")
}

// ExitInheritanceSpecifier is called when production inheritanceSpecifier is exited.
func (s *SourceUnitListener) ExitInheritanceSpecifier(ctx *parser.InheritanceSpecifierContext) {
	name := ctx.UserDefinedTypeName().GetText()
	body := ctx.GetText()

	lastInheritance := s.LastInheritance()
	lastInheritance.Name = name
	lastInheritance.Body = body
	fmt.Println("Exit Inheritance Specifier")
}

// EnterContractPart is called when production contractPart is entered.
func (s *SourceUnitListener) EnterContractPart(ctx *parser.ContractPartContext) {
	fmt.Println("Enter Contract Part")
}

// ExitContractPart is called when production contractPart is exited.
func (s *SourceUnitListener) ExitContractPart(ctx *parser.ContractPartContext) {
	fmt.Println("Exit Contract Part")
}

// EnterStateVariableDeclaration is called when production stateVariableDeclaration is entered.
func (s *SourceUnitListener) EnterStateVariableDeclaration(ctx *parser.StateVariableDeclarationContext) {
	stateVariable := Variable{
		Id: uuid.NewString(),
	}
	lastContract := s.LastContract()
	lastContract.Variables = append(lastContract.Variables, stateVariable)

	fmt.Println("Enter State Variable Declaration")
}

// ExitStateVariableDeclaration is called when production stateVariableDeclaration is exited.
func (s *SourceUnitListener) ExitStateVariableDeclaration(ctx *parser.StateVariableDeclarationContext) {
	var modifiers []string

	name := ctx.Identifier().GetText()
	typeStr := ctx.TypeName().GetText()
	if typeStr == "addresspayable" {
		modifiers = append(modifiers, "payable")
		typeStr = "address"
	}

	// Check for visibility and other modifiers
	if len(ctx.AllPublicKeyword()) > 0 {
		modifiers = append(modifiers, "public")
	}
	if len(ctx.AllPrivateKeyword()) > 0 {
		modifiers = append(modifiers, "private")
	}
	if len(ctx.AllInternalKeyword()) > 0 {
		modifiers = append(modifiers, "internal")
	}
	if len(ctx.AllConstantKeyword()) > 0 {
		modifiers = append(modifiers, "constant")
	}
	if len(ctx.AllImmutableKeyword()) > 0 {
		modifiers = append(modifiers, "immutable")
	}
	// Handle override specifiers if necessary
	// Note: This example does not extract specific information from override specifiers,
	// but you could expand this to capture more detailed info if needed.
	if len(ctx.AllOverrideSpecifier()) > 0 {
		modifiers = append(modifiers, "override")
	}

	// Create a new variable with the collected information
	variable := Variable{
		Name:      name,
		Type:      typeStr,
		Modifiers: modifiers,
	}

	// Determine visibility if it's specified as one of the modifiers
	// This is a simplified approach; you might refine it based on your needs.
	for _, mod := range modifiers {
		switch mod {
		case "public", "private", "internal":
			variable.Visibility = mod
			break // Found visibility, no need to check further
		}
	}

	// Assuming you have a method to add the variable to your source unit
	lastStateVariable := s.LastStateVariable()
	lastStateVariable.Name = variable.Name
	lastStateVariable.Type = variable.Type
	lastStateVariable.Visibility = variable.Visibility
	lastStateVariable.Modifiers = variable.Modifiers

	fmt.Printf("Exited State Variable Declaration: %+v\n", variable)
}

// // EnterFileLevelConstant is called when production fileLevelConstant is entered.
// func (s *SourceUnitListener) EnterFileLevelConstant(ctx *parser.FileLevelConstantContext) {
// 	fmt.Println("here")
// }

// // ExitFileLevelConstant is called when production fileLevelConstant is exited.
// func (s *SourceUnitListener) ExitFileLevelConstant(ctx *parser.FileLevelConstantContext) {
// 	fmt.Println("here")
// }

// EnterCustomErrorDefinition is called when production customErrorDefinition is entered.
func (s *SourceUnitListener) EnterCustomErrorDefinition(ctx *parser.CustomErrorDefinitionContext) {
	s.IsInCustomError = true

	customError := CustomError{
		Id: uuid.NewString(),
	}
	if s.IsInContract {
		lastContract := s.LastContract()
		lastContract.CustomErrors = append(lastContract.CustomErrors, customError)
	} else {
		s.SourceUnit.CustomErrors = append(s.SourceUnit.CustomErrors, customError)
	}

	fmt.Println("Enter Custom Error Definition")
}

// ExitCustomErrorDefinition is called when production customErrorDefinition is exited.
func (s *SourceUnitListener) ExitCustomErrorDefinition(ctx *parser.CustomErrorDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastCustomError := s.LastCustomError()
	lastCustomError.Name = name

	s.IsInCustomError = false

	fmt.Println("Exit Custom Error Definition")
}

// // EnterTypeDefinition is called when production typeDefinition is entered.
// func (s *SourceUnitListener) EnterTypeDefinition(ctx *parser.TypeDefinitionContext) {
// 	fmt.Println("here")
// }

// // ExitTypeDefinition is called when production typeDefinition is exited.
// func (s *SourceUnitListener) ExitTypeDefinition(ctx *parser.TypeDefinitionContext) { fmt.Println("here") }

// // EnterUsingForDeclaration is called when production usingForDeclaration is entered.
// func (s *SourceUnitListener) EnterUsingForDeclaration(ctx *parser.UsingForDeclarationContext) {
// 	fmt.Println("here")
// }

// // ExitUsingForDeclaration is called when production usingForDeclaration is exited.
// func (s *SourceUnitListener) ExitUsingForDeclaration(ctx *parser.UsingForDeclarationContext) {
// 	fmt.Println("here")
// }

// // EnterUsingForObject is called when production usingForObject is entered.
// func (s *SourceUnitListener) EnterUsingForObject(ctx *parser.UsingForObjectContext) {
// 	fmt.Println("here")
// }

// // ExitUsingForObject is called when production usingForObject is exited.
// func (s *SourceUnitListener) ExitUsingForObject(ctx *parser.UsingForObjectContext) { fmt.Println("here") }

// // EnterUsingForObjectDirective is called when production usingForObjectDirective is entered.
// func (s *SourceUnitListener) EnterUsingForObjectDirective(ctx *parser.UsingForObjectDirectiveContext) {
// 	fmt.Println("here")
// }

// // ExitUsingForObjectDirective is called when production usingForObjectDirective is exited.
// func (s *SourceUnitListener) ExitUsingForObjectDirective(ctx *parser.UsingForObjectDirectiveContext) {
// 	fmt.Println("here")
// }

// // EnterUserDefinableOperators is called when production userDefinableOperators is entered.
// func (s *SourceUnitListener) EnterUserDefinableOperators(ctx *parser.UserDefinableOperatorsContext) {
// 	fmt.Println("here")
// }

// // ExitUserDefinableOperators is called when production userDefinableOperators is exited.
// func (s *SourceUnitListener) ExitUserDefinableOperators(ctx *parser.UserDefinableOperatorsContext) {
// 	fmt.Println("here")
// }

// EnterStructDefinition is called when production structDefinition is entered.
func (s *SourceUnitListener) EnterStructDefinition(ctx *parser.StructDefinitionContext) {
	s.IsInStruct = true

	structure := Struct{
		Id: uuid.NewString(),
	}
	if s.IsInContract {
		lastContract := s.LastContract()
		lastContract.Structs = append(lastContract.Structs, structure)
	} else {
		s.SourceUnit.Structs = append(s.SourceUnit.Structs, structure)
	}
	fmt.Println("Enter Struct Definition")
}

// ExitStructDefinition is called when production structDefinition is exited.
func (s *SourceUnitListener) ExitStructDefinition(ctx *parser.StructDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastStruct := s.LastStruct()
	lastStruct.Name = name

	s.IsInStruct = false
	fmt.Println("Exit Struct Definition")
}

// EnterModifierDefinition is called when production modifierDefinition is entered.
func (s *SourceUnitListener) EnterModifierDefinition(ctx *parser.ModifierDefinitionContext) {
	s.IsInModifierDefinition = true
	modifier := Modifier{
		Id: uuid.NewString(),
	}
	lastContract := s.LastContract()
	lastContract.Modifiers = append(lastContract.Modifiers, modifier)
	fmt.Println("Enter Modifier Definition")
}

// ExitModifierDefinition is called when production modifierDefinition is exited.
func (s *SourceUnitListener) ExitModifierDefinition(ctx *parser.ModifierDefinitionContext) {

	name := ctx.Identifier().GetText()
	lastModifier := s.LastModifierDefinition()
	lastModifier.Name = name

	s.IsInModifierDefinition = false
	fmt.Println("Exit Modifier Definition")
}

// // EnterModifierInvocation is called when production modifierInvocation is entered.
// func (s *SourceUnitListener) EnterModifierInvocation(ctx *parser.ModifierInvocationContext) {
// 	fmt.Println("here")
// }

// // ExitModifierInvocation is called when production modifierInvocation is exited.
// func (s *SourceUnitListener) ExitModifierInvocation(ctx *parser.ModifierInvocationContext) {
// 	fmt.Println("here")
// }

// EnterFunctionDefinition is called when production functionDefinition is entered.
func (s *SourceUnitListener) EnterFunctionDefinition(ctx *parser.FunctionDefinitionContext) {
	s.IsInFunctionDefinition = true

	function := Function{
		Id: uuid.NewString(),
	}
	if s.IsInContract {
		lastContract := s.LastContract()
		lastContract.Functions = append(lastContract.Functions, function)
	} else {
		s.SourceUnit.Functions = append(s.SourceUnit.Functions, function)
	}

	fmt.Println("Enter Function Definitino")
}

// ExitFunctionDefinition is called when production functionDefinition is exited.
func (s *SourceUnitListener) ExitFunctionDefinition(ctx *parser.FunctionDefinitionContext) {

	s.IsInFunctionDefinition = false
	fmt.Println("Exit Function Definition")
}

// EnterFunctionDescriptor is called when production functionDescriptor is entered.
func (s *SourceUnitListener) EnterFunctionDescriptor(ctx *parser.FunctionDescriptorContext) {
	fmt.Println("Enter Function Descriptor")
}

// ExitFunctionDescriptor is called when production functionDescriptor is exited.
func (s *SourceUnitListener) ExitFunctionDescriptor(ctx *parser.FunctionDescriptorContext) {
	var name string
	if ctx.ConstructorKeyword() != nil {
		name = "constructor"
	} else if ctx.FallbackKeyword() != nil {
		name = "fallback"
	} else if ctx.ReceiveKeyword() != nil {
		name = "receive"
	} else {
		name = ctx.Identifier().GetText()
	}

	lastFunction := s.LastFunctionDefinition()
	lastFunction.Name = name
	fmt.Println("Exit Function Descriptor")
}

// EnterReturnParameters is called when production returnParameters is entered.
func (s *SourceUnitListener) EnterReturnParameters(ctx *parser.ReturnParametersContext) {
	s.IsInReturnParameter = true
	fmt.Println("Enter Return Parameters")
}

// ExitReturnParameters is called when production returnParameters is exited.
func (s *SourceUnitListener) ExitReturnParameters(ctx *parser.ReturnParametersContext) {
	s.IsInReturnParameter = false
	fmt.Println("Exit Return Parameters")
}

// EnterModifierList is called when production modifierList is entered.
func (s *SourceUnitListener) EnterModifierList(ctx *parser.ModifierListContext) {
	fmt.Println("Enter Modifier List")
}

// ExitModifierList is called when production modifierList is exited.
func (s *SourceUnitListener) ExitModifierList(ctx *parser.ModifierListContext) {

	lastFunction := s.LastFunctionDefinition()

	// Collect all modifiers
	var modifiers []string
	if len(ctx.AllExternalKeyword()) > 0 {
		modifiers = append(modifiers, "external")
	}
	if len(ctx.AllPublicKeyword()) > 0 {
		modifiers = append(modifiers, "public")
	}
	if len(ctx.AllInternalKeyword()) > 0 {
		modifiers = append(modifiers, "internal")
	}
	if len(ctx.AllPrivateKeyword()) > 0 {
		modifiers = append(modifiers, "private")
	}
	if len(ctx.AllModifierInvocation()) > 0 {
		for _, mod := range ctx.AllModifierInvocation() {
			modifiers = append(modifiers, mod.GetText())
		}
	}
	if len(ctx.AllOverrideSpecifier()) > 0 {
		modifiers = append(modifiers, "override")
	}
	lastFunction.Modifiers = modifiers

	for _, mod := range modifiers {
		switch mod {
		case "public", "private", "internal":
			lastFunction.Visibility = mod
			break
		}
	}

	// Check for state mutability
	if len(ctx.AllStateMutability()) > 0 {
		lastFunction.StateMutability = ctx.StateMutability(0).GetText()
	}

	fmt.Println("Exit Modifier List")
}

// EnterEventDefinition is called when production eventDefinition is entered.
func (s *SourceUnitListener) EnterEventDefinition(ctx *parser.EventDefinitionContext) {
	s.IsInEventDefinition = true

	event := Event{
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

// ExitEventDefinition is called when production eventDefinition is exited.
func (s *SourceUnitListener) ExitEventDefinition(ctx *parser.EventDefinitionContext) {

	name := ctx.Identifier().GetText()
	lastEvent := s.LastEventDefinition()
	lastEvent.Name = name

	s.IsInEventDefinition = false
	fmt.Println("Exit Event Definition")
}

// EnterEnumValue is called when production enumValue is entered.
func (s *SourceUnitListener) EnterEnumValue(ctx *parser.EnumValueContext) {
	fmt.Println("Enter Enum Value")
}

// ExitEnumValue is called when production enumValue is exited.
func (s *SourceUnitListener) ExitEnumValue(ctx *parser.EnumValueContext) {
	value := ctx.Identifier().GetText()
	lastEnum := s.LastEnum()
	lastEnum.Values = append(lastEnum.Values, value)
	fmt.Println("Exit Enum Value")
}

// EnterEnumDefinition is called when production enumDefinition is entered.
func (s *SourceUnitListener) EnterEnumDefinition(ctx *parser.EnumDefinitionContext) {
	enum := Enum{
		Id: uuid.NewString(),
	}
	if s.IsInContract {
		lastContract := s.LastContract()
		lastContract.Enums = append(lastContract.Enums, enum)
	} else {
		s.SourceUnit.Enums = append(s.SourceUnit.Enums, enum)
	}
	fmt.Println("Enter Enum Definition")
}

// ExitEnumDefinition is called when production enumDefinition is exited.
func (s *SourceUnitListener) ExitEnumDefinition(ctx *parser.EnumDefinitionContext) {
	name := ctx.Identifier().GetText()
	lastEnum := s.LastEnum()
	lastEnum.Name = name

	fmt.Println("Exit Enum Definition")
}

// // EnterParameterList is called when production parameterList is entered.
// func (s *SourceUnitListener) EnterParameterList(ctx *parser.ParameterListContext) {
// 	fmt.Println("Enter Parameter List")
// }

// // ExitParameterList is called when production parameterList is exited.
// func (s *SourceUnitListener) ExitParameterList(ctx *parser.ParameterListContext) {
// 	fmt.Println("Exit Parameter List")
// }

// EnterParameter is called when production parameter is entered.
func (s *SourceUnitListener) EnterParameter(ctx *parser.ParameterContext) {
	parameter := Parameter{
		Id: uuid.NewString(),
	}

	if s.IsInCustomError {
		lastCustomError := s.LastCustomError()
		lastCustomError.Parameters = append(lastCustomError.Parameters, parameter)
		return
	}

	lastFunction := s.LastFunctionDefinition()
	if s.IsInReturnParameter {
		lastFunction.Returns = append(lastFunction.Returns, parameter)
		return
	}
	lastFunction.Parameters = append(lastFunction.Parameters, parameter)

	fmt.Println("Enter Parameter")
}

// ExitParameter is called when production parameter is exited.
func (s *SourceUnitListener) ExitParameter(ctx *parser.ParameterContext) {

	typeStr := ctx.TypeName().GetText()

	var name string
	if ctx.Identifier() == nil {
		name = ""
	} else {
		name = ctx.Identifier().GetText()
	}

	var storage string
	if ctx.StorageLocation() != nil {
		storage = ctx.StorageLocation().GetText()
	}

	var lastParameter *Parameter
	if s.IsInReturnParameter {
		lastParameter = s.LastReturn()
	} else if s.IsInCustomError {
		lastParameter = s.LastCustomErrorParameter()
	} else {
		lastParameter = s.LastFunctionParameter()
	}

	lastParameter.Name = name
	lastParameter.Type = typeStr
	lastParameter.Storage = storage

	fmt.Println("Exit Parameter")
}

// // EnterEventParameterList is called when production eventParameterList is entered.
// func (s *SourceUnitListener) EnterEventParameterList(ctx *parser.EventParameterListContext) {
// 	fmt.Println("here")
// }

// // ExitEventParameterList is called when production eventParameterList is exited.
// func (s *SourceUnitListener) ExitEventParameterList(ctx *parser.EventParameterListContext) {
// 	fmt.Println("here")
// }

// EnterEventParameter is called when production eventParameter is entered.
func (s *SourceUnitListener) EnterEventParameter(ctx *parser.EventParameterContext) {
	parameter := Parameter{
		Id: uuid.NewString(),
	}
	lastEvent := s.LastEventDefinition()
	lastEvent.Parameters = append(lastEvent.Parameters, parameter)

	fmt.Println("Enter Event Parameter")
}

// ExitEventParameter is called when production eventParameter is exited.
func (s *SourceUnitListener) ExitEventParameter(ctx *parser.EventParameterContext) {
	typeStr := ctx.TypeName().GetText()

	var name string
	if ctx.Identifier() == nil {
		name = ""
	} else {
		name = ctx.Identifier().GetText()
	}

	lastParameter := s.LastEventParameter()

	lastParameter.Name = name
	lastParameter.Type = typeStr
	fmt.Println("Exit Event Parameter")
}

// EnterFunctionTypeParameterList is called when production functionTypeParameterList is entered.
func (s *SourceUnitListener) EnterFunctionTypeParameterList(ctx *parser.FunctionTypeParameterListContext) {
	fmt.Println("Enter Function Type Parameter List")
}

// ExitFunctionTypeParameterList is called when production functionTypeParameterList is exited.
func (s *SourceUnitListener) ExitFunctionTypeParameterList(ctx *parser.FunctionTypeParameterListContext) {
	fmt.Println("Exit Function Type Parameter List")
}

// // EnterFunctionTypeParameter is called when production functionTypeParameter is entered.
// func (s *SourceUnitListener) EnterFunctionTypeParameter(ctx *parser.FunctionTypeParameterContext) {
// 	fmt.Println("here")
// }

// // ExitFunctionTypeParameter is called when production functionTypeParameter is exited.
// func (s *SourceUnitListener) ExitFunctionTypeParameter(ctx *parser.FunctionTypeParameterContext) {
// 	fmt.Println("here")
// }

// EnterVariableDeclaration is called when production variableDeclaration is entered.
func (s *SourceUnitListener) EnterVariableDeclaration(ctx *parser.VariableDeclarationContext) {
	variable := Variable{
		Id: uuid.NewString(),
	}
	if s.IsInStruct {
		lastStruct := s.LastStruct()
		lastStruct.Fields = append(lastStruct.Fields, variable)
	}
	fmt.Println("Enter Variable Declaration")
}

// ExitVariableDeclaration is called when production variableDeclaration is exited.
func (s *SourceUnitListener) ExitVariableDeclaration(ctx *parser.VariableDeclarationContext) {
	name := ctx.Identifier().GetText()
	typeStr := ctx.TypeName().GetText()

	if s.IsInStruct {
		lastField := s.LastStructField()
		lastField.Name = name
		lastField.Type = typeStr
	}

	fmt.Println("Exit Variable Declaration")
}

// // EnterTypeName is called when production typeName is entered.
// func (s *SourceUnitListener) EnterTypeName(ctx *parser.TypeNameContext) { fmt.Println("here") }

// // ExitTypeName is called when production typeName is exited.
// func (s *SourceUnitListener) ExitTypeName(ctx *parser.TypeNameContext) { fmt.Println("here") }

// // EnterUserDefinedTypeName is called when production userDefinedTypeName is entered.
// func (s *SourceUnitListener) EnterUserDefinedTypeName(ctx *parser.UserDefinedTypeNameContext) {
// 	fmt.Println("here")
// }

// // ExitUserDefinedTypeName is called when production userDefinedTypeName is exited.
// func (s *SourceUnitListener) ExitUserDefinedTypeName(ctx *parser.UserDefinedTypeNameContext) {
// 	fmt.Println("here")
// }

// // EnterMappingKey is called when production mappingKey is entered.
// func (s *SourceUnitListener) EnterMappingKey(ctx *parser.MappingKeyContext) { fmt.Println("here") }

// // ExitMappingKey is called when production mappingKey is exited.
// func (s *SourceUnitListener) ExitMappingKey(ctx *parser.MappingKeyContext) { fmt.Println("here") }

// EnterMapping is called when production mapping is entered.
func (s *SourceUnitListener) EnterMapping(ctx *parser.MappingContext) {
	lastVariable := s.LastStateVariable()
	lastVariable.Type = "mapping"
	fmt.Println("Enter Mapping")
}

// ExitMapping is called when production mapping is exited.
func (s *SourceUnitListener) ExitMapping(ctx *parser.MappingContext) {
	from := ctx.MappingKey().GetText()
	to := ctx.TypeName().GetText()

	lastVariable := s.LastStateVariable()
	lastVariable.MappingFrom = from
	lastVariable.MappingTo = to

	fmt.Println("Exit Mapping")
}

// // EnterMappingKeyName is called when production mappingKeyName is entered.
// func (s *SourceUnitListener) EnterMappingKeyName(ctx *parser.MappingKeyNameContext) {
// 	fmt.Println("here")
// }

// // ExitMappingKeyName is called when production mappingKeyName is exited.
// func (s *SourceUnitListener) ExitMappingKeyName(ctx *parser.MappingKeyNameContext) { fmt.Println("here") }

// // EnterMappingValueName is called when production mappingValueName is entered.
// func (s *SourceUnitListener) EnterMappingValueName(ctx *parser.MappingValueNameContext) {
// 	fmt.Println("here")
// }

// // ExitMappingValueName is called when production mappingValueName is exited.
// func (s *SourceUnitListener) ExitMappingValueName(ctx *parser.MappingValueNameContext) {
// 	fmt.Println("here")
// }

// // EnterFunctionTypeName is called when production functionTypeName is entered.
// func (s *SourceUnitListener) EnterFunctionTypeName(ctx *parser.FunctionTypeNameContext) {
// 	fmt.Println("here")
// }

// // ExitFunctionTypeName is called when production functionTypeName is exited.
// func (s *SourceUnitListener) ExitFunctionTypeName(ctx *parser.FunctionTypeNameContext) {
// 	fmt.Println("here")
// }

// // EnterStorageLocation is called when production storageLocation is entered.
// func (s *SourceUnitListener) EnterStorageLocation(ctx *parser.StorageLocationContext) {
// 	fmt.Println("here")
// }

// // ExitStorageLocation is called when production storageLocation is exited.
// func (s *SourceUnitListener) ExitStorageLocation(ctx *parser.StorageLocationContext) {
// 	fmt.Println("here")
// }

// // EnterStateMutability is called when production stateMutability is entered.
// func (s *SourceUnitListener) EnterStateMutability(ctx *parser.StateMutabilityContext) {
// 	fmt.Println("here")
// }

// // ExitStateMutability is called when production stateMutability is exited.
// func (s *SourceUnitListener) ExitStateMutability(ctx *parser.StateMutabilityContext) {
// 	fmt.Println("here")
// }

// EnterBlock is called when production block is entered.
func (s *SourceUnitListener) EnterBlock(ctx *parser.BlockContext) {
	fmt.Println("Enter Block")
}

// ExitBlock is called when production block is exited.
func (s *SourceUnitListener) ExitBlock(ctx *parser.BlockContext) {

	if s.IsInFunctionDefinition {
		lastFunction := s.LastFunctionDefinition()
		lastFunction.Body = extractTextWithWhitespace(ctx, ctx.GetParser().GetTokenStream())
	}
	if s.IsInModifierDefinition {
		lastModifier := s.LastModifierDefinition()
		lastModifier.Body = extractTextWithWhitespace(ctx, ctx.GetParser().GetTokenStream())
	}

	fmt.Println("Exit Block")
}

// // EnterStatement is called when production statement is entered.
// func (s *SourceUnitListener) EnterStatement(ctx *parser.StatementContext) { fmt.Println("here") }

// // ExitStatement is called when production statement is exited.
// func (s *SourceUnitListener) ExitStatement(ctx *parser.StatementContext) { fmt.Println("here") }

// // EnterExpressionStatement is called when production expressionStatement is entered.
// func (s *SourceUnitListener) EnterExpressionStatement(ctx *parser.ExpressionStatementContext) {
// 	fmt.Println("here")
// }

// // ExitExpressionStatement is called when production expressionStatement is exited.
// func (s *SourceUnitListener) ExitExpressionStatement(ctx *parser.ExpressionStatementContext) {
// 	fmt.Println("here")
// }

// // EnterIfStatement is called when production ifStatement is entered.
// func (s *SourceUnitListener) EnterIfStatement(ctx *parser.IfStatementContext) { fmt.Println("here") }

// // ExitIfStatement is called when production ifStatement is exited.
// func (s *SourceUnitListener) ExitIfStatement(ctx *parser.IfStatementContext) { fmt.Println("here") }

// // EnterTryStatement is called when production tryStatement is entered.
// func (s *SourceUnitListener) EnterTryStatement(ctx *parser.TryStatementContext) { fmt.Println("here") }

// // ExitTryStatement is called when production tryStatement is exited.
// func (s *SourceUnitListener) ExitTryStatement(ctx *parser.TryStatementContext) { fmt.Println("here") }

// // EnterCatchClause is called when production catchClause is entered.
// func (s *SourceUnitListener) EnterCatchClause(ctx *parser.CatchClauseContext) { fmt.Println("here") }

// // ExitCatchClause is called when production catchClause is exited.
// func (s *SourceUnitListener) ExitCatchClause(ctx *parser.CatchClauseContext) { fmt.Println("here") }

// // EnterWhileStatement is called when production whileStatement is entered.
// func (s *SourceUnitListener) EnterWhileStatement(ctx *parser.WhileStatementContext) {
// 	fmt.Println("here")
// }

// // ExitWhileStatement is called when production whileStatement is exited.
// func (s *SourceUnitListener) ExitWhileStatement(ctx *parser.WhileStatementContext) { fmt.Println("here") }

// // EnterSimpleStatement is called when production simpleStatement is entered.
// func (s *SourceUnitListener) EnterSimpleStatement(ctx *parser.SimpleStatementContext) {
// 	fmt.Println("here")
// }

// // ExitSimpleStatement is called when production simpleStatement is exited.
// func (s *SourceUnitListener) ExitSimpleStatement(ctx *parser.SimpleStatementContext) {
// 	fmt.Println("here")
// }

// // EnterUncheckedStatement is called when production uncheckedStatement is entered.
// func (s *SourceUnitListener) EnterUncheckedStatement(ctx *parser.UncheckedStatementContext) {
// 	fmt.Println("here")
// }

// // ExitUncheckedStatement is called when production uncheckedStatement is exited.
// func (s *SourceUnitListener) ExitUncheckedStatement(ctx *parser.UncheckedStatementContext) {
// 	fmt.Println("here")
// }

// // EnterForStatement is called when production forStatement is entered.
// func (s *SourceUnitListener) EnterForStatement(ctx *parser.ForStatementContext) { fmt.Println("here") }

// // ExitForStatement is called when production forStatement is exited.
// func (s *SourceUnitListener) ExitForStatement(ctx *parser.ForStatementContext) { fmt.Println("here") }

// // EnterInlineAssemblyStatement is called when production inlineAssemblyStatement is entered.
// func (s *SourceUnitListener) EnterInlineAssemblyStatement(ctx *parser.InlineAssemblyStatementContext) {
// 	fmt.Println("here")
// }

// // ExitInlineAssemblyStatement is called when production inlineAssemblyStatement is exited.
// func (s *SourceUnitListener) ExitInlineAssemblyStatement(ctx *parser.InlineAssemblyStatementContext) {
// 	fmt.Println("here")
// }

// // EnterInlineAssemblyStatementFlag is called when production inlineAssemblyStatementFlag is entered.
// func (s *SourceUnitListener) EnterInlineAssemblyStatementFlag(ctx *parser.InlineAssemblyStatementFlagContext) {
// }

// // ExitInlineAssemblyStatementFlag is called when production inlineAssemblyStatementFlag is exited.
// func (s *SourceUnitListener) ExitInlineAssemblyStatementFlag(ctx *parser.InlineAssemblyStatementFlagContext) {
// }

// // EnterDoWhileStatement is called when production doWhileStatement is entered.
// func (s *SourceUnitListener) EnterDoWhileStatement(ctx *parser.DoWhileStatementContext) {
// 	fmt.Println("here")
// }

// // ExitDoWhileStatement is called when production doWhileStatement is exited.
// func (s *SourceUnitListener) ExitDoWhileStatement(ctx *parser.DoWhileStatementContext) {
// 	fmt.Println("here")
// }

// // EnterContinueStatement is called when production continueStatement is entered.
// func (s *SourceUnitListener) EnterContinueStatement(ctx *parser.ContinueStatementContext) {
// 	fmt.Println("here")
// }

// // ExitContinueStatement is called when production continueStatement is exited.
// func (s *SourceUnitListener) ExitContinueStatement(ctx *parser.ContinueStatementContext) {
// 	fmt.Println("here")
// }

// // EnterBreakStatement is called when production breakStatement is entered.
// func (s *SourceUnitListener) EnterBreakStatement(ctx *parser.BreakStatementContext) {
// 	fmt.Println("here")
// }

// // ExitBreakStatement is called when production breakStatement is exited.
// func (s *SourceUnitListener) ExitBreakStatement(ctx *parser.BreakStatementContext) { fmt.Println("here") }

// // EnterReturnStatement is called when production returnStatement is entered.
// func (s *SourceUnitListener) EnterReturnStatement(ctx *parser.ReturnStatementContext) {
// 	fmt.Println("here")
// }

// // ExitReturnStatement is called when production returnStatement is exited.
// func (s *SourceUnitListener) ExitReturnStatement(ctx *parser.ReturnStatementContext) {
// 	fmt.Println("here")
// }

// // EnterThrowStatement is called when production throwStatement is entered.
// func (s *SourceUnitListener) EnterThrowStatement(ctx *parser.ThrowStatementContext) {
// 	fmt.Println("here")
// }

// // ExitThrowStatement is called when production throwStatement is exited.
// func (s *SourceUnitListener) ExitThrowStatement(ctx *parser.ThrowStatementContext) { fmt.Println("here") }

// // EnterEmitStatement is called when production emitStatement is entered.
// func (s *SourceUnitListener) EnterEmitStatement(ctx *parser.EmitStatementContext) { fmt.Println("here") }

// // ExitEmitStatement is called when production emitStatement is exited.
// func (s *SourceUnitListener) ExitEmitStatement(ctx *parser.EmitStatementContext) { fmt.Println("here") }

// // EnterRevertStatement is called when production revertStatement is entered.
// func (s *SourceUnitListener) EnterRevertStatement(ctx *parser.RevertStatementContext) {
// 	fmt.Println("here")
// }

// // ExitRevertStatement is called when production revertStatement is exited.
// func (s *SourceUnitListener) ExitRevertStatement(ctx *parser.RevertStatementContext) {
// 	fmt.Println("here")
// }

// // EnterVariableDeclarationStatement is called when production variableDeclarationStatement is entered.
// func (s *SourceUnitListener) EnterVariableDeclarationStatement(ctx *parser.VariableDeclarationStatementContext) {
// }

// // ExitVariableDeclarationStatement is called when production variableDeclarationStatement is exited.
// func (s *SourceUnitListener) ExitVariableDeclarationStatement(ctx *parser.VariableDeclarationStatementContext) {
// }

// // EnterVariableDeclarationList is called when production variableDeclarationList is entered.
// func (s *SourceUnitListener) EnterVariableDeclarationList(ctx *parser.VariableDeclarationListContext) {
// 	fmt.Println("here")
// }

// // ExitVariableDeclarationList is called when production variableDeclarationList is exited.
// func (s *SourceUnitListener) ExitVariableDeclarationList(ctx *parser.VariableDeclarationListContext) {
// 	fmt.Println("here")
// }

// // EnterIdentifierList is called when production identifierList is entered.
// func (s *SourceUnitListener) EnterIdentifierList(ctx *parser.IdentifierListContext) {
// 	fmt.Println("here")
// }

// // ExitIdentifierList is called when production identifierList is exited.
// func (s *SourceUnitListener) ExitIdentifierList(ctx *parser.IdentifierListContext) { fmt.Println("here") }

// // EnterElementaryTypeName is called when production elementaryTypeName is entered.
// func (s *SourceUnitListener) EnterElementaryTypeName(ctx *parser.ElementaryTypeNameContext) {
// 	fmt.Println("here")
// }

// // ExitElementaryTypeName is called when production elementaryTypeName is exited.
// func (s *SourceUnitListener) ExitElementaryTypeName(ctx *parser.ElementaryTypeNameContext) {
// 	fmt.Println("here")
// }

// // EnterExpression is called when production expression is entered.
// func (s *SourceUnitListener) EnterExpression(ctx *parser.ExpressionContext) { fmt.Println("here") }

// // ExitExpression is called when production expression is exited.
// func (s *SourceUnitListener) ExitExpression(ctx *parser.ExpressionContext) { fmt.Println("here") }

// // EnterPrimaryExpression is called when production primaryExpression is entered.
// func (s *SourceUnitListener) EnterPrimaryExpression(ctx *parser.PrimaryExpressionContext) {
// 	fmt.Println("here")
// }

// // ExitPrimaryExpression is called when production primaryExpression is exited.
// func (s *SourceUnitListener) ExitPrimaryExpression(ctx *parser.PrimaryExpressionContext) {
// 	fmt.Println("here")
// }

// // EnterExpressionList is called when production expressionList is entered.
// func (s *SourceUnitListener) EnterExpressionList(ctx *parser.ExpressionListContext) {
// 	fmt.Println("here")
// }

// // ExitExpressionList is called when production expressionList is exited.
// func (s *SourceUnitListener) ExitExpressionList(ctx *parser.ExpressionListContext) { fmt.Println("here") }

// // EnterNameValueList is called when production nameValueList is entered.
// func (s *SourceUnitListener) EnterNameValueList(ctx *parser.NameValueListContext) { fmt.Println("here") }

// // ExitNameValueList is called when production nameValueList is exited.
// func (s *SourceUnitListener) ExitNameValueList(ctx *parser.NameValueListContext) { fmt.Println("here") }

// // EnterNameValue is called when production nameValue is entered.
// func (s *SourceUnitListener) EnterNameValue(ctx *parser.NameValueContext) { fmt.Println("here") }

// // ExitNameValue is called when production nameValue is exited.
// func (s *SourceUnitListener) ExitNameValue(ctx *parser.NameValueContext) { fmt.Println("here") }

// // EnterFunctionCallArguments is called when production functionCallArguments is entered.
// func (s *SourceUnitListener) EnterFunctionCallArguments(ctx *parser.FunctionCallArgumentsContext) {
// 	fmt.Println("here")
// }

// // ExitFunctionCallArguments is called when production functionCallArguments is exited.
// func (s *SourceUnitListener) ExitFunctionCallArguments(ctx *parser.FunctionCallArgumentsContext) {
// 	fmt.Println("here")
// }

// // EnterFunctionCall is called when production functionCall is entered.
// func (s *SourceUnitListener) EnterFunctionCall(ctx *parser.FunctionCallContext) { fmt.Println("here") }

// // ExitFunctionCall is called when production functionCall is exited.
// func (s *SourceUnitListener) ExitFunctionCall(ctx *parser.FunctionCallContext) { fmt.Println("here") }

// // EnterAssemblyBlock is called when production assemblyBlock is entered.
// func (s *SourceUnitListener) EnterAssemblyBlock(ctx *parser.AssemblyBlockContext) { fmt.Println("here") }

// // ExitAssemblyBlock is called when production assemblyBlock is exited.
// func (s *SourceUnitListener) ExitAssemblyBlock(ctx *parser.AssemblyBlockContext) { fmt.Println("here") }

// // EnterAssemblyItem is called when production assemblyItem is entered.
// func (s *SourceUnitListener) EnterAssemblyItem(ctx *parser.AssemblyItemContext) { fmt.Println("here") }

// // ExitAssemblyItem is called when production assemblyItem is exited.
// func (s *SourceUnitListener) ExitAssemblyItem(ctx *parser.AssemblyItemContext) { fmt.Println("here") }

// // EnterAssemblyExpression is called when production assemblyExpression is entered.
// func (s *SourceUnitListener) EnterAssemblyExpression(ctx *parser.AssemblyExpressionContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblyExpression is called when production assemblyExpression is exited.
// func (s *SourceUnitListener) ExitAssemblyExpression(ctx *parser.AssemblyExpressionContext) {
// 	fmt.Println("here")
// }

// // EnterAssemblyMember is called when production assemblyMember is entered.
// func (s *SourceUnitListener) EnterAssemblyMember(ctx *parser.AssemblyMemberContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblyMember is called when production assemblyMember is exited.
// func (s *SourceUnitListener) ExitAssemblyMember(ctx *parser.AssemblyMemberContext) { fmt.Println("here") }

// // EnterAssemblyCall is called when production assemblyCall is entered.
// func (s *SourceUnitListener) EnterAssemblyCall(ctx *parser.AssemblyCallContext) { fmt.Println("here") }

// // ExitAssemblyCall is called when production assemblyCall is exited.
// func (s *SourceUnitListener) ExitAssemblyCall(ctx *parser.AssemblyCallContext) { fmt.Println("here") }

// // EnterAssemblyLocalDefinition is called when production assemblyLocalDefinition is entered.
// func (s *SourceUnitListener) EnterAssemblyLocalDefinition(ctx *parser.AssemblyLocalDefinitionContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblyLocalDefinition is called when production assemblyLocalDefinition is exited.
// func (s *SourceUnitListener) ExitAssemblyLocalDefinition(ctx *parser.AssemblyLocalDefinitionContext) {
// 	fmt.Println("here")
// }

// // EnterAssemblyAssignment is called when production assemblyAssignment is entered.
// func (s *SourceUnitListener) EnterAssemblyAssignment(ctx *parser.AssemblyAssignmentContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblyAssignment is called when production assemblyAssignment is exited.
// func (s *SourceUnitListener) ExitAssemblyAssignment(ctx *parser.AssemblyAssignmentContext) {
// 	fmt.Println("here")
// }

// // EnterAssemblyIdentifierOrList is called when production assemblyIdentifierOrList is entered.
// func (s *SourceUnitListener) EnterAssemblyIdentifierOrList(ctx *parser.AssemblyIdentifierOrListContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblyIdentifierOrList is called when production assemblyIdentifierOrList is exited.
// func (s *SourceUnitListener) ExitAssemblyIdentifierOrList(ctx *parser.AssemblyIdentifierOrListContext) {
// 	fmt.Println("here")
// }

// // EnterAssemblyIdentifierList is called when production assemblyIdentifierList is entered.
// func (s *SourceUnitListener) EnterAssemblyIdentifierList(ctx *parser.AssemblyIdentifierListContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblyIdentifierList is called when production assemblyIdentifierList is exited.
// func (s *SourceUnitListener) ExitAssemblyIdentifierList(ctx *parser.AssemblyIdentifierListContext) {
// 	fmt.Println("here")
// }

// // EnterAssemblyStackAssignment is called when production assemblyStackAssignment is entered.
// func (s *SourceUnitListener) EnterAssemblyStackAssignment(ctx *parser.AssemblyStackAssignmentContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblyStackAssignment is called when production assemblyStackAssignment is exited.
// func (s *SourceUnitListener) ExitAssemblyStackAssignment(ctx *parser.AssemblyStackAssignmentContext) {
// 	fmt.Println("here")
// }

// // EnterLabelDefinition is called when production labelDefinition is entered.
// func (s *SourceUnitListener) EnterLabelDefinition(ctx *parser.LabelDefinitionContext) {
// 	fmt.Println("here")
// }

// // ExitLabelDefinition is called when production labelDefinition is exited.
// func (s *SourceUnitListener) ExitLabelDefinition(ctx *parser.LabelDefinitionContext) {
// 	fmt.Println("here")
// }

// // EnterAssemblySwitch is called when production assemblySwitch is entered.
// func (s *SourceUnitListener) EnterAssemblySwitch(ctx *parser.AssemblySwitchContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblySwitch is called when production assemblySwitch is exited.
// func (s *SourceUnitListener) ExitAssemblySwitch(ctx *parser.AssemblySwitchContext) { fmt.Println("here") }

// // EnterAssemblyCase is called when production assemblyCase is entered.
// func (s *SourceUnitListener) EnterAssemblyCase(ctx *parser.AssemblyCaseContext) { fmt.Println("here") }

// // ExitAssemblyCase is called when production assemblyCase is exited.
// func (s *SourceUnitListener) ExitAssemblyCase(ctx *parser.AssemblyCaseContext) { fmt.Println("here") }

// // EnterAssemblyFunctionDefinition is called when production assemblyFunctionDefinition is entered.
// func (s *SourceUnitListener) EnterAssemblyFunctionDefinition(ctx *parser.AssemblyFunctionDefinitionContext) {
// }

// // ExitAssemblyFunctionDefinition is called when production assemblyFunctionDefinition is exited.
// func (s *SourceUnitListener) ExitAssemblyFunctionDefinition(ctx *parser.AssemblyFunctionDefinitionContext) {
// }

// // EnterAssemblyFunctionReturns is called when production assemblyFunctionReturns is entered.
// func (s *SourceUnitListener) EnterAssemblyFunctionReturns(ctx *parser.AssemblyFunctionReturnsContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblyFunctionReturns is called when production assemblyFunctionReturns is exited.
// func (s *SourceUnitListener) ExitAssemblyFunctionReturns(ctx *parser.AssemblyFunctionReturnsContext) {
// 	fmt.Println("here")
// }

// // EnterAssemblyFor is called when production assemblyFor is entered.
// func (s *SourceUnitListener) EnterAssemblyFor(ctx *parser.AssemblyForContext) { fmt.Println("here") }

// // ExitAssemblyFor is called when production assemblyFor is exited.
// func (s *SourceUnitListener) ExitAssemblyFor(ctx *parser.AssemblyForContext) { fmt.Println("here") }

// // EnterAssemblyIf is called when production assemblyIf is entered.
// func (s *SourceUnitListener) EnterAssemblyIf(ctx *parser.AssemblyIfContext) { fmt.Println("here") }

// // ExitAssemblyIf is called when production assemblyIf is exited.
// func (s *SourceUnitListener) ExitAssemblyIf(ctx *parser.AssemblyIfContext) { fmt.Println("here") }

// // EnterAssemblyLiteral is called when production assemblyLiteral is entered.
// func (s *SourceUnitListener) EnterAssemblyLiteral(ctx *parser.AssemblyLiteralContext) {
// 	fmt.Println("here")
// }

// // ExitAssemblyLiteral is called when production assemblyLiteral is exited.
// func (s *SourceUnitListener) ExitAssemblyLiteral(ctx *parser.AssemblyLiteralContext) {
// 	fmt.Println("here")
// }

// // EnterTupleExpression is called when production tupleExpression is entered.
// func (s *SourceUnitListener) EnterTupleExpression(ctx *parser.TupleExpressionContext) {
// 	fmt.Println("here")
// }

// // ExitTupleExpression is called when production tupleExpression is exited.
// func (s *SourceUnitListener) ExitTupleExpression(ctx *parser.TupleExpressionContext) {
// 	fmt.Println("here")
// }

// // EnterNumberLiteral is called when production numberLiteral is entered.
// func (s *SourceUnitListener) EnterNumberLiteral(ctx *parser.NumberLiteralContext) { fmt.Println("here") }

// // ExitNumberLiteral is called when production numberLiteral is exited.
// func (s *SourceUnitListener) ExitNumberLiteral(ctx *parser.NumberLiteralContext) { fmt.Println("here") }

// // EnterIdentifier is called when production identifier is entered.
// func (s *SourceUnitListener) EnterIdentifier(ctx *parser.IdentifierContext) { fmt.Println("here") }

// // ExitIdentifier is called when production identifier is exited.
// func (s *SourceUnitListener) ExitIdentifier(ctx *parser.IdentifierContext) { fmt.Println("here") }

// // EnterHexLiteral is called when production hexLiteral is entered.
// func (s *SourceUnitListener) EnterHexLiteral(ctx *parser.HexLiteralContext) { fmt.Println("here") }

// // ExitHexLiteral is called when production hexLiteral is exited.
// func (s *SourceUnitListener) ExitHexLiteral(ctx *parser.HexLiteralContext) { fmt.Println("here") }

// // EnterOverrideSpecifier is called when production overrideSpecifier is entered.
// func (s *SourceUnitListener) EnterOverrideSpecifier(ctx *parser.OverrideSpecifierContext) {
// 	fmt.Println("here")
// }

// // ExitOverrideSpecifier is called when production overrideSpecifier is exited.
// func (s *SourceUnitListener) ExitOverrideSpecifier(ctx *parser.OverrideSpecifierContext) {
// 	fmt.Println("here")
// }

// // EnterStringLiteral is called when production stringLiteral is entered.
// func (s *SourceUnitListener) EnterStringLiteral(ctx *parser.StringLiteralContext) { fmt.Println("here") }

// // ExitStringLiteral is called when production stringLiteral is exited.
// func (s *SourceUnitListener) ExitStringLiteral(ctx *parser.StringLiteralContext) { fmt.Println("here") }
