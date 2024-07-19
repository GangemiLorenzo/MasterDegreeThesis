// Code generated from Solidity.g4 by ANTLR 4.13.1. DO NOT EDIT.

package parser // Solidity
import "github.com/antlr4-go/antlr/v4"

type BaseSolidityVisitor struct {
	*antlr.BaseParseTreeVisitor
}

func (v *BaseSolidityVisitor) VisitSourceUnit(ctx *SourceUnitContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitPragmaDirective(ctx *PragmaDirectiveContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitPragmaName(ctx *PragmaNameContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitPragmaValue(ctx *PragmaValueContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitVersion(ctx *VersionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitVersionOperator(ctx *VersionOperatorContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitVersionConstraint(ctx *VersionConstraintContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitImportDeclaration(ctx *ImportDeclarationContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitImportDirective(ctx *ImportDirectiveContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitImportPath(ctx *ImportPathContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitContractDefinition(ctx *ContractDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitInheritanceSpecifier(ctx *InheritanceSpecifierContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitContractPart(ctx *ContractPartContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitStateVariableDeclaration(ctx *StateVariableDeclarationContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitFileLevelConstant(ctx *FileLevelConstantContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitCustomErrorDefinition(ctx *CustomErrorDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitTypeDefinition(ctx *TypeDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitUsingForDeclaration(ctx *UsingForDeclarationContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitUsingForObject(ctx *UsingForObjectContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitUsingForObjectDirective(ctx *UsingForObjectDirectiveContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitUserDefinableOperators(ctx *UserDefinableOperatorsContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitStructDefinition(ctx *StructDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitModifierDefinition(ctx *ModifierDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitModifierInvocation(ctx *ModifierInvocationContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitFunctionDefinition(ctx *FunctionDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitFunctionDescriptor(ctx *FunctionDescriptorContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitReturnParameters(ctx *ReturnParametersContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitModifierList(ctx *ModifierListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitEventDefinition(ctx *EventDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitEnumValue(ctx *EnumValueContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitEnumDefinition(ctx *EnumDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitParameterList(ctx *ParameterListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitParameter(ctx *ParameterContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitEventParameterList(ctx *EventParameterListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitEventParameter(ctx *EventParameterContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitFunctionTypeParameterList(ctx *FunctionTypeParameterListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitFunctionTypeParameter(ctx *FunctionTypeParameterContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitVariableDeclaration(ctx *VariableDeclarationContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitTypeName(ctx *TypeNameContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitUserDefinedTypeName(ctx *UserDefinedTypeNameContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitMappingKey(ctx *MappingKeyContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitMapping(ctx *MappingContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitMappingKeyName(ctx *MappingKeyNameContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitMappingValueName(ctx *MappingValueNameContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitFunctionTypeName(ctx *FunctionTypeNameContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitStorageLocation(ctx *StorageLocationContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitStateMutability(ctx *StateMutabilityContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitBlock(ctx *BlockContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitStatement(ctx *StatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitExpressionStatement(ctx *ExpressionStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitIfStatement(ctx *IfStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitTryStatement(ctx *TryStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitCatchClause(ctx *CatchClauseContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitWhileStatement(ctx *WhileStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitSimpleStatement(ctx *SimpleStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitUncheckedStatement(ctx *UncheckedStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitForStatement(ctx *ForStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitInlineAssemblyStatement(ctx *InlineAssemblyStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitInlineAssemblyStatementFlag(ctx *InlineAssemblyStatementFlagContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitDoWhileStatement(ctx *DoWhileStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitContinueStatement(ctx *ContinueStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitBreakStatement(ctx *BreakStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitReturnStatement(ctx *ReturnStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitThrowStatement(ctx *ThrowStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitEmitStatement(ctx *EmitStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitRevertStatement(ctx *RevertStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitVariableDeclarationStatement(ctx *VariableDeclarationStatementContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitVariableDeclarationList(ctx *VariableDeclarationListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitIdentifierList(ctx *IdentifierListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitElementaryTypeName(ctx *ElementaryTypeNameContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitExpression(ctx *ExpressionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitPrimaryExpression(ctx *PrimaryExpressionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitExpressionList(ctx *ExpressionListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitNameValueList(ctx *NameValueListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitNameValue(ctx *NameValueContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitFunctionCallArguments(ctx *FunctionCallArgumentsContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitFunctionCall(ctx *FunctionCallContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyBlock(ctx *AssemblyBlockContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyItem(ctx *AssemblyItemContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyExpression(ctx *AssemblyExpressionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyMember(ctx *AssemblyMemberContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyCall(ctx *AssemblyCallContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyLocalDefinition(ctx *AssemblyLocalDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyAssignment(ctx *AssemblyAssignmentContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyIdentifierOrList(ctx *AssemblyIdentifierOrListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyIdentifierList(ctx *AssemblyIdentifierListContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyStackAssignment(ctx *AssemblyStackAssignmentContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitLabelDefinition(ctx *LabelDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblySwitch(ctx *AssemblySwitchContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyCase(ctx *AssemblyCaseContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyFunctionDefinition(ctx *AssemblyFunctionDefinitionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyFunctionReturns(ctx *AssemblyFunctionReturnsContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyFor(ctx *AssemblyForContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyIf(ctx *AssemblyIfContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitAssemblyLiteral(ctx *AssemblyLiteralContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitTupleExpression(ctx *TupleExpressionContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitNumberLiteral(ctx *NumberLiteralContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitIdentifier(ctx *IdentifierContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitHexLiteral(ctx *HexLiteralContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitOverrideSpecifier(ctx *OverrideSpecifierContext) interface{} {
	return v.VisitChildren(ctx)
}

func (v *BaseSolidityVisitor) VisitStringLiteral(ctx *StringLiteralContext) interface{} {
	return v.VisitChildren(ctx)
}
