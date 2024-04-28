package rest_server

type Task struct {
	ID           string                 `json:"id"`
	Status       TaskStatus             `json:"status"`
	ContractCode string                 `json:"contractCode"`
	Result       map[string]interface{} `json:"result"`
	Progress     int                    `json:"progress"`
}

type TaskStatus string

const (
	Processing TaskStatus = "processing"
	Completed  TaskStatus = "completed"
	Failed     TaskStatus = "failed"
)
