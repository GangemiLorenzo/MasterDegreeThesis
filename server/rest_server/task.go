package rest_server

type Task struct {
	ID              string                 `json:"id"`
	Status          TaskStatus             `json:"status"`
	StatusMessage   string                 `json:"statusMessage"`
	ContractCode    string                 `json:"contractCode"`
	Result          map[string]interface{} `json:"result"`
	Links           map[string]interface{} `json:"links"`
	Warnings        map[string]interface{} `json:"warnings"`
	Vulnerabilities map[string]interface{} `json:"vulnerabilities"`
	Progress        int                    `json:"progress"`
}

type TaskStatus string

const (
	Processing TaskStatus = "processing"
	Completed  TaskStatus = "completed"
	Failed     TaskStatus = "failed"
)
