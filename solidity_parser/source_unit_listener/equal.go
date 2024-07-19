package source_unit_listener

func (s SourceUnit) Equals(other SourceUnit) bool {
	return isEqualPragmas(s.Pragmas, other.Pragmas) &&
		isEqualContracts(s.Contracts, other.Contracts) &&
		isEqualImports(s.Imports, other.Imports) &&
		isEqualEnums(s.Enums, other.Enums) &&
		isEqualEvents(s.Events, other.Events) &&
		isEqualStructs(s.Structs, other.Structs) &&
		isEqualFunctions(s.Functions, other.Functions) &&
		isEqualCustomErrors(s.CustomErrors, other.CustomErrors)
}

func (p PragmaDirective) Equals(other PragmaDirective) bool {
	return p.Name == other.Name && p.Value == other.Value
}

func (i ImportDefinition) Equals(other ImportDefinition) bool {
	return i.Path == other.Path && isEqualSymbols(i.Symbols, other.Symbols)
}

func (s SymbolDefinition) Equals(other SymbolDefinition) bool {
	return s.Name == other.Name && s.Alias == other.Alias
}

func (c ContractDefinition) Equals(other ContractDefinition) bool {
	return c.Name == other.Name &&
		isEqualVariables(c.Variables, other.Variables) &&
		isEqualFunctions(c.Functions, other.Functions) &&
		isEqualModifiers(c.Modifiers, other.Modifiers) &&
		isEqualEvents(c.Events, other.Events) &&
		isEqualInheritances(c.Inheritance, other.Inheritance) &&
		isEqualEnums(c.Enums, other.Enums) &&
		isEqualStructs(c.Structs, other.Structs) &&
		c.IsInterface == other.IsInterface &&
		c.IsLibrary == other.IsLibrary &&
		isEqualCustomErrors(c.CustomErrors, other.CustomErrors)
}

func (i InheritanceDefinition) Equals(other InheritanceDefinition) bool {
	return i.Name == other.Name
}

func (v VariableDefinition) Equals(other VariableDefinition) bool {
	return v.Name == other.Name && v.Type == other.Type && v.Visibility == other.Visibility &&
		isEqualStringModifiers(v.Modifiers, other.Modifiers) && v.MappingFrom == other.MappingFrom &&
		v.MappingTo == other.MappingTo
}

func (f FunctionDefinition) Equals(other FunctionDefinition) bool {
	return f.Name == other.Name &&
		isEqualParameters(f.Parameters, other.Parameters) &&
		isEqualParameters(f.Returns, other.Returns) &&
		f.Visibility == other.Visibility &&
		f.Body == other.Body &&
		f.StateMutability == other.StateMutability &&
		isEqualStringModifiers(f.Modifiers, other.Modifiers)
}

func (m ModifierDefinition) Equals(other ModifierDefinition) bool {
	return m.Name == other.Name && m.Body == other.Body
}

func (e EventDefinition) Equals(other EventDefinition) bool {
	return e.Name == other.Name && isEqualParameters(e.Parameters, other.Parameters)
}

func (e EnumDefinition) Equals(other EnumDefinition) bool {
	return e.Name == other.Name && isEqualStringSlices(e.Values, other.Values)
}

func (s StructDefinition) Equals(other StructDefinition) bool {
	return s.Name == other.Name && isEqualVariables(s.Fields, other.Fields)
}

func (ce CustomErrorDefinition) Equals(other CustomErrorDefinition) bool {
	return ce.Name == other.Name && isEqualParameters(ce.Parameters, other.Parameters)
}

func (p ParameterDefinition) Equals(other ParameterDefinition) bool {
	return p.Name == other.Name && p.Type == other.Type && p.Storage == other.Storage
}

func isEqualContracts(slice1, slice2 []ContractDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualPragmas(slice1, slice2 []PragmaDirective) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualImports(slice1, slice2 []ImportDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualSymbols(slice1, slice2 []SymbolDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualVariables(slice1, slice2 []VariableDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualFunctions(slice1, slice2 []FunctionDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualModifiers(slice1, slice2 []ModifierDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualStringModifiers(slice1, slice2 []string) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !(slice1[i] == slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualEvents(slice1, slice2 []EventDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualInheritances(slice1, slice2 []InheritanceDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualEnums(slice1, slice2 []EnumDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualStructs(slice1, slice2 []StructDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualCustomErrors(slice1, slice2 []CustomErrorDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualParameters(slice1, slice2 []ParameterDefinition) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if !slice1[i].Equals(slice2[i]) {
			return false
		}
	}
	return true
}

func isEqualStringSlices(slice1, slice2 []string) bool {
	if len(slice1) != len(slice2) {
		return false
	}
	for i := range slice1 {
		if slice1[i] != slice2[i] {
			return false
		}
	}
	return true
}
