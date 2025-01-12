package source_unit_listener

type Element interface {
	GetId() string
	SetDescription(description string)
	UpdateDescription(id string, description string)
	GetCodeAsString() string
}
