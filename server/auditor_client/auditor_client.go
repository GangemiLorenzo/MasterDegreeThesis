package auditor_client

import (
	"context"
	"time"

	service "auditor/auditor_service"

	"google.golang.org/grpc"
)

type AuditorClient interface {
	Audit(data string, code string) ([]*service.Vulnerability, error)
	ConvertVulnerabilities(vulnerabilities []*service.Vulnerability) map[string]interface{}
}

type auditorClient struct {
	client service.AuditorServiceClient
}

func NewAuditorClient(cc *grpc.ClientConn) AuditorClient {
	return &auditorClient{
		client: service.NewAuditorServiceClient(cc),
	}
}

func (c *auditorClient) Audit(data string, code string) ([]*service.Vulnerability, error) {
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*60)
	defer cancel()

	resp, err := c.client.Audit(ctx, &service.AuditRequest{JsonStructure: data, SmartContractCode: code})
	if err != nil {
		return nil, err
	}
	return resp.Vulnerabilities, nil

}

func (c *auditorClient) ConvertVulnerabilities(vulnerabilities []*service.Vulnerability) map[string]interface{} {
	vulns := make([]map[string]interface{}, len(vulnerabilities))
	for i, v := range vulnerabilities {
		vulns[i] = map[string]interface{}{
			"Name":        v.Name,
			"Description": v.Description,
			"Severity":    v.Severity,
		}
	}
	return map[string]interface{}{
		"vulnerabilities": vulns,
	}
}
