package source_unit_listener

type SourceUnit struct {
	Id           string            `json:"id"`
	Pragmas      []PragmaDirective `json:"pragmas"`
	Contracts    []Contract        `json:"contracts"`
	Imports      []Import          `json:"imports"`
	Enums        []Enum            `json:"enums"`
	Events       []Event           `json:"events"`
	Structs      []Struct          `json:"structs"`
	Functions    []Function        `json:"functions"`
	CustomErrors []CustomError     `json:"errors"`
}

type PragmaDirective struct {
	Id    string `json:"id"`
	Name  string `json:"name"`
	Value string `json:"value"`
}

type Import struct {
	Id      string   `json:"id"`
	Path    string   `json:"path"`
	Symbols []Symbol `json:"symbols"`
}

type Symbol struct {
	Id    string `json:"id"`
	Name  string `json:"name"`
	Alias string `json:"alias"`
}

type Contract struct {
	Id           string        `json:"id"`
	Name         string        `json:"name"`
	Variables    []Variable    `json:"variables"`
	Functions    []Function    `json:"functions"`
	Modifiers    []Modifier    `json:"modifiers"`
	Events       []Event       `json:"events"`
	Inheritance  []Inheritance `json:"inheritance"`
	Enums        []Enum        `json:"enums"`
	Structs      []Struct      `json:"structs"`
	IsInterface  bool          `json:"isInterface"`
	IsLibrary    bool          `json:"isLibrary"`
	CustomErrors []CustomError `json:"errors"`
}

type Inheritance struct {
	Id   string `json:"id"`
	Name string `json:"name"`
	Body string `json:"body"`
}

type Variable struct {
	Id          string   `json:"id"`
	Name        string   `json:"name"`
	Type        string   `json:"type"`
	Visibility  string   `json:"visibility"`
	Modifiers   []string `json:"modifiers"`
	MappingFrom string   `json:"mappingFrom"`
	MappingTo   string   `json:"mappingTo"`
}

type Parameter struct {
	Id      string `json:"id"`
	Name    string `json:"name"`
	Type    string `json:"type"`
	Storage string `json:"storage"`
}

type Function struct {
	Id              string      `json:"id"`
	Name            string      `json:"name"`
	Parameters      []Parameter `json:"parameters"`
	Returns         []Parameter `json:"returns"`
	Visibility      string      `json:"visibility"`
	Body            string      `json:"body"`
	StateMutability string      `json:"stateMutability"`
	Modifiers       []string    `json:"modifiers"`
}

type Modifier struct {
	Id   string `json:"id"`
	Name string `json:"name"`
	Body string `json:"body"`
}

type Event struct {
	Id         string      `json:"id"`
	Name       string      `json:"name"`
	Parameters []Parameter `json:"parameters"`
}

type Enum struct {
	Id     string   `json:"id"`
	Name   string   `json:"name"`
	Values []string `json:"values"`
}

type Struct struct {
	Id     string     `json:"id"`
	Name   string     `json:"name"`
	Fields []Variable `json:"fields"`
}

type CustomError struct {
	Id         string      `json:"id"`
	Name       string      `json:"name"`
	Parameters []Parameter `json:"parameters"`
}
