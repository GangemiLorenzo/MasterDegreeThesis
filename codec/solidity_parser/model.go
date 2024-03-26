package solidity_parser

type SourceUnit struct {
	Pragmas   []PragmaDirective `json:"pragmas"`
	Contracts []*Contract       `json:"contracts"`
}

type PragmaDirective struct {
	Name  string `json:"name"`
	Value string `json:"value"`
}

type Contract struct {
	Name        string     `json:"name"`
	Variables   []Variable `json:"variables"`
	Functions   []Function `json:"functions"`
	Modifiers   []Modifier `json:"modifiers"`
	Events      []Event    `json:"events"`
	Inheritance []string   `json:"inheritance"` // Names of base contracts, if any
}

type Variable struct {
	Name       string   `json:"name"`
	Type       string   `json:"type"`
	Visibility string   `json:"visibility"`
	Modifiers  []string `json:"modifiers"`
}

type Parameter struct {
	Name    string `json:"name"`
	Type    string `json:"type"`
	Storage string `json:"storage"`
}

type Function struct {
	Name            string      `json:"name"`
	Parameters      []Parameter `json:"parameters"`
	Returns         []Parameter `json:"returns"`
	Visibility      string      `json:"visibility"`
	Body            string      `json:"body"`
	StateMutability string      `json:"stateMutability"`
	Modifiers       []string    `json:"modifiers"` // List of names of modifiers applied to the function
}

type Modifier struct {
	Name string `json:"name"`
	Body string `json:"body"`
}

type Event struct {
	Name       string     `json:"name"`
	Parameters []Variable `json:"parameters"`
}
