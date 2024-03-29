// Code generated from Solidity.g4 by ANTLR 4.13.1. DO NOT EDIT.

package parser // Solidity
import "github.com/antlr4-go/antlr/v4"

// A complete Visitor for a parse tree produced by SolidityParser.
type SolidityVisitor interface {
	antlr.ParseTreeVisitor

	// Visit a parse tree produced by SolidityParser#sourceUnit.
	VisitSourceUnit(ctx *SourceUnitContext) interface{}

	// Visit a parse tree produced by SolidityParser#pragmaDirective.
	VisitPragmaDirective(ctx *PragmaDirectiveContext) interface{}

	// Visit a parse tree produced by SolidityParser#pragmaName.
	VisitPragmaName(ctx *PragmaNameContext) interface{}

	// Visit a parse tree produced by SolidityParser#pragmaValue.
	VisitPragmaValue(ctx *PragmaValueContext) interface{}

	// Visit a parse tree produced by SolidityParser#version.
	VisitVersion(ctx *VersionContext) interface{}

	// Visit a parse tree produced by SolidityParser#versionOperator.
	VisitVersionOperator(ctx *VersionOperatorContext) interface{}

	// Visit a parse tree produced by SolidityParser#versionConstraint.
	VisitVersionConstraint(ctx *VersionConstraintContext) interface{}

	// Visit a parse tree produced by SolidityParser#importDeclaration.
	VisitImportDeclaration(ctx *ImportDeclarationContext) interface{}

	// Visit a parse tree produced by SolidityParser#importDirective.
	VisitImportDirective(ctx *ImportDirectiveContext) interface{}

	// Visit a parse tree produced by SolidityParser#importPath.
	VisitImportPath(ctx *ImportPathContext) interface{}

	// Visit a parse tree produced by SolidityParser#contractDefinition.
	VisitContractDefinition(ctx *ContractDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#interfaceDefinition.
	VisitInterfaceDefinition(ctx *InterfaceDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#interfacePart.
	VisitInterfacePart(ctx *InterfacePartContext) interface{}

	// Visit a parse tree produced by SolidityParser#inheritanceSpecifier.
	VisitInheritanceSpecifier(ctx *InheritanceSpecifierContext) interface{}

	// Visit a parse tree produced by SolidityParser#contractPart.
	VisitContractPart(ctx *ContractPartContext) interface{}

	// Visit a parse tree produced by SolidityParser#stateVariableDeclaration.
	VisitStateVariableDeclaration(ctx *StateVariableDeclarationContext) interface{}

	// Visit a parse tree produced by SolidityParser#fileLevelConstant.
	VisitFileLevelConstant(ctx *FileLevelConstantContext) interface{}

	// Visit a parse tree produced by SolidityParser#customErrorDefinition.
	VisitCustomErrorDefinition(ctx *CustomErrorDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#typeDefinition.
	VisitTypeDefinition(ctx *TypeDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#usingForDeclaration.
	VisitUsingForDeclaration(ctx *UsingForDeclarationContext) interface{}

	// Visit a parse tree produced by SolidityParser#usingForObject.
	VisitUsingForObject(ctx *UsingForObjectContext) interface{}

	// Visit a parse tree produced by SolidityParser#usingForObjectDirective.
	VisitUsingForObjectDirective(ctx *UsingForObjectDirectiveContext) interface{}

	// Visit a parse tree produced by SolidityParser#userDefinableOperators.
	VisitUserDefinableOperators(ctx *UserDefinableOperatorsContext) interface{}

	// Visit a parse tree produced by SolidityParser#structDefinition.
	VisitStructDefinition(ctx *StructDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#modifierDefinition.
	VisitModifierDefinition(ctx *ModifierDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#modifierInvocation.
	VisitModifierInvocation(ctx *ModifierInvocationContext) interface{}

	// Visit a parse tree produced by SolidityParser#functionDefinition.
	VisitFunctionDefinition(ctx *FunctionDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#functionDescriptor.
	VisitFunctionDescriptor(ctx *FunctionDescriptorContext) interface{}

	// Visit a parse tree produced by SolidityParser#returnParameters.
	VisitReturnParameters(ctx *ReturnParametersContext) interface{}

	// Visit a parse tree produced by SolidityParser#modifierList.
	VisitModifierList(ctx *ModifierListContext) interface{}

	// Visit a parse tree produced by SolidityParser#eventDefinition.
	VisitEventDefinition(ctx *EventDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#enumValue.
	VisitEnumValue(ctx *EnumValueContext) interface{}

	// Visit a parse tree produced by SolidityParser#enumDefinition.
	VisitEnumDefinition(ctx *EnumDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#parameterList.
	VisitParameterList(ctx *ParameterListContext) interface{}

	// Visit a parse tree produced by SolidityParser#parameter.
	VisitParameter(ctx *ParameterContext) interface{}

	// Visit a parse tree produced by SolidityParser#eventParameterList.
	VisitEventParameterList(ctx *EventParameterListContext) interface{}

	// Visit a parse tree produced by SolidityParser#eventParameter.
	VisitEventParameter(ctx *EventParameterContext) interface{}

	// Visit a parse tree produced by SolidityParser#functionTypeParameterList.
	VisitFunctionTypeParameterList(ctx *FunctionTypeParameterListContext) interface{}

	// Visit a parse tree produced by SolidityParser#functionTypeParameter.
	VisitFunctionTypeParameter(ctx *FunctionTypeParameterContext) interface{}

	// Visit a parse tree produced by SolidityParser#variableDeclaration.
	VisitVariableDeclaration(ctx *VariableDeclarationContext) interface{}

	// Visit a parse tree produced by SolidityParser#typeName.
	VisitTypeName(ctx *TypeNameContext) interface{}

	// Visit a parse tree produced by SolidityParser#userDefinedTypeName.
	VisitUserDefinedTypeName(ctx *UserDefinedTypeNameContext) interface{}

	// Visit a parse tree produced by SolidityParser#mappingKey.
	VisitMappingKey(ctx *MappingKeyContext) interface{}

	// Visit a parse tree produced by SolidityParser#mapping.
	VisitMapping(ctx *MappingContext) interface{}

	// Visit a parse tree produced by SolidityParser#mappingKeyName.
	VisitMappingKeyName(ctx *MappingKeyNameContext) interface{}

	// Visit a parse tree produced by SolidityParser#mappingValueName.
	VisitMappingValueName(ctx *MappingValueNameContext) interface{}

	// Visit a parse tree produced by SolidityParser#functionTypeName.
	VisitFunctionTypeName(ctx *FunctionTypeNameContext) interface{}

	// Visit a parse tree produced by SolidityParser#storageLocation.
	VisitStorageLocation(ctx *StorageLocationContext) interface{}

	// Visit a parse tree produced by SolidityParser#stateMutability.
	VisitStateMutability(ctx *StateMutabilityContext) interface{}

	// Visit a parse tree produced by SolidityParser#block.
	VisitBlock(ctx *BlockContext) interface{}

	// Visit a parse tree produced by SolidityParser#statement.
	VisitStatement(ctx *StatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#expressionStatement.
	VisitExpressionStatement(ctx *ExpressionStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#ifStatement.
	VisitIfStatement(ctx *IfStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#tryStatement.
	VisitTryStatement(ctx *TryStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#catchClause.
	VisitCatchClause(ctx *CatchClauseContext) interface{}

	// Visit a parse tree produced by SolidityParser#whileStatement.
	VisitWhileStatement(ctx *WhileStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#simpleStatement.
	VisitSimpleStatement(ctx *SimpleStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#uncheckedStatement.
	VisitUncheckedStatement(ctx *UncheckedStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#forStatement.
	VisitForStatement(ctx *ForStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#inlineAssemblyStatement.
	VisitInlineAssemblyStatement(ctx *InlineAssemblyStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#inlineAssemblyStatementFlag.
	VisitInlineAssemblyStatementFlag(ctx *InlineAssemblyStatementFlagContext) interface{}

	// Visit a parse tree produced by SolidityParser#doWhileStatement.
	VisitDoWhileStatement(ctx *DoWhileStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#continueStatement.
	VisitContinueStatement(ctx *ContinueStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#breakStatement.
	VisitBreakStatement(ctx *BreakStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#returnStatement.
	VisitReturnStatement(ctx *ReturnStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#throwStatement.
	VisitThrowStatement(ctx *ThrowStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#emitStatement.
	VisitEmitStatement(ctx *EmitStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#revertStatement.
	VisitRevertStatement(ctx *RevertStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#variableDeclarationStatement.
	VisitVariableDeclarationStatement(ctx *VariableDeclarationStatementContext) interface{}

	// Visit a parse tree produced by SolidityParser#variableDeclarationList.
	VisitVariableDeclarationList(ctx *VariableDeclarationListContext) interface{}

	// Visit a parse tree produced by SolidityParser#identifierList.
	VisitIdentifierList(ctx *IdentifierListContext) interface{}

	// Visit a parse tree produced by SolidityParser#elementaryTypeName.
	VisitElementaryTypeName(ctx *ElementaryTypeNameContext) interface{}

	// Visit a parse tree produced by SolidityParser#expression.
	VisitExpression(ctx *ExpressionContext) interface{}

	// Visit a parse tree produced by SolidityParser#primaryExpression.
	VisitPrimaryExpression(ctx *PrimaryExpressionContext) interface{}

	// Visit a parse tree produced by SolidityParser#expressionList.
	VisitExpressionList(ctx *ExpressionListContext) interface{}

	// Visit a parse tree produced by SolidityParser#nameValueList.
	VisitNameValueList(ctx *NameValueListContext) interface{}

	// Visit a parse tree produced by SolidityParser#nameValue.
	VisitNameValue(ctx *NameValueContext) interface{}

	// Visit a parse tree produced by SolidityParser#functionCallArguments.
	VisitFunctionCallArguments(ctx *FunctionCallArgumentsContext) interface{}

	// Visit a parse tree produced by SolidityParser#functionCall.
	VisitFunctionCall(ctx *FunctionCallContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyBlock.
	VisitAssemblyBlock(ctx *AssemblyBlockContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyItem.
	VisitAssemblyItem(ctx *AssemblyItemContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyExpression.
	VisitAssemblyExpression(ctx *AssemblyExpressionContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyMember.
	VisitAssemblyMember(ctx *AssemblyMemberContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyCall.
	VisitAssemblyCall(ctx *AssemblyCallContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyLocalDefinition.
	VisitAssemblyLocalDefinition(ctx *AssemblyLocalDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyAssignment.
	VisitAssemblyAssignment(ctx *AssemblyAssignmentContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyIdentifierOrList.
	VisitAssemblyIdentifierOrList(ctx *AssemblyIdentifierOrListContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyIdentifierList.
	VisitAssemblyIdentifierList(ctx *AssemblyIdentifierListContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyStackAssignment.
	VisitAssemblyStackAssignment(ctx *AssemblyStackAssignmentContext) interface{}

	// Visit a parse tree produced by SolidityParser#labelDefinition.
	VisitLabelDefinition(ctx *LabelDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblySwitch.
	VisitAssemblySwitch(ctx *AssemblySwitchContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyCase.
	VisitAssemblyCase(ctx *AssemblyCaseContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyFunctionDefinition.
	VisitAssemblyFunctionDefinition(ctx *AssemblyFunctionDefinitionContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyFunctionReturns.
	VisitAssemblyFunctionReturns(ctx *AssemblyFunctionReturnsContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyFor.
	VisitAssemblyFor(ctx *AssemblyForContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyIf.
	VisitAssemblyIf(ctx *AssemblyIfContext) interface{}

	// Visit a parse tree produced by SolidityParser#assemblyLiteral.
	VisitAssemblyLiteral(ctx *AssemblyLiteralContext) interface{}

	// Visit a parse tree produced by SolidityParser#tupleExpression.
	VisitTupleExpression(ctx *TupleExpressionContext) interface{}

	// Visit a parse tree produced by SolidityParser#numberLiteral.
	VisitNumberLiteral(ctx *NumberLiteralContext) interface{}

	// Visit a parse tree produced by SolidityParser#identifier.
	VisitIdentifier(ctx *IdentifierContext) interface{}

	// Visit a parse tree produced by SolidityParser#hexLiteral.
	VisitHexLiteral(ctx *HexLiteralContext) interface{}

	// Visit a parse tree produced by SolidityParser#overrideSpecifier.
	VisitOverrideSpecifier(ctx *OverrideSpecifierContext) interface{}

	// Visit a parse tree produced by SolidityParser#stringLiteral.
	VisitStringLiteral(ctx *StringLiteralContext) interface{}
}
