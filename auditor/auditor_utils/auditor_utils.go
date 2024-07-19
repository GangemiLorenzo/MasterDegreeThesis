package auditor_utils

import (
	"encoding/json"
	"fmt"
	"os"
	"os/exec"

	"github.com/google/uuid"
)

// AuditorUtils provides utility functions for Solidity compilation and AST generation.
type AuditorUtils struct {
}

// NewAuditorUtils creates a new instance of AuditorUtils with the provided compiler path.
func NewAuditorUtils() *AuditorUtils {
	return &AuditorUtils{}
}

// CheckValidity runs the Solidity compiler to check code validity
func (scu *AuditorUtils) RunAudit(code string) ([]Vulnerability, error) {
	//defer os.Remove("report.json")

	solFilePath := "reports/report" + uuid.NewString() + ".sol"

	tempFile, err := os.Create(solFilePath)
	if err != nil {
		return nil, err
	}

	_, err = tempFile.WriteString(code)
	if err != nil {
		return nil, fmt.Errorf("failed to write code to temporary file: %v", err)
	}
	tempFile.Close()

	filepath := "reports/report" + uuid.NewString() + ".json"
	cmd := exec.Command("slither", tempFile.Name(), "--json", filepath)
	if err := cmd.Start(); err != nil {
		return nil, fmt.Errorf("failed to start slither command: %v", err)
	}
	waitError := cmd.Wait()
	fmt.Errorf("failed to start slither command: %v", waitError)

	reportData, err := os.ReadFile(filepath)
	if err != nil {
		return nil, fmt.Errorf("failed to read report file: %v", err)
	}

	var report map[string]interface{}
	if err := json.Unmarshal(reportData, &report); err != nil {
		return nil, fmt.Errorf("failed to unmarshal report data: %v", err)
	}

	var vulnerabilities []Vulnerability
	if results, ok := report["results"].(map[string]interface{}); ok {
		if detections, ok := results["detectors"].([]interface{}); ok {
			for _, detection := range detections {
				if detectionMap, ok := detection.(map[string]interface{}); ok {
					vulnerability := Vulnerability{
						Check:       detectionMap["check"].(string),
						Description: detectionMap["description"].(string),
						Severity:    detectionMap["impact"].(string),
					}
					vulnerabilities = append(vulnerabilities, vulnerability)
				}
			}
		}
	}

	return vulnerabilities, nil
}
