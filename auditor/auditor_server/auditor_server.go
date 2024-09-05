package codec_server

import (
	"context"
	"encoding/json"

	service "auditor/auditor_service"
	"auditor/auditor_utils"
	parser "solidity_parser/source_unit_listener"
)

type auditorServer struct {
	service.UnimplementedAuditorServiceServer
	auditor_utils auditor_utils.AuditorUtils
}

func NewAuditorServer(auditor_utils auditor_utils.AuditorUtils) service.AuditorServiceServer {
	return &auditorServer{
		auditor_utils: auditor_utils,
	}
}

// Audit implements the logic for the RPC.
func (s *auditorServer) Audit(ctx context.Context, req *service.AuditRequest) (*service.AuditResponse, error) {
	println("Audit called")

	var sourceUnit parser.SourceUnit
	err := json.Unmarshal([]byte(req.JsonStructure), &sourceUnit)
	if err != nil {
		return nil, err
	}

	code := req.SmartContractCode

	vulnerabilities, err := s.auditor_utils.RunAudit(code)
	if err != nil {
		return nil, err
	}

	var vulnerabilitiesResponse []*service.Vulnerability
	for _, v := range vulnerabilities {
		vulnerabilitiesResponse = append(vulnerabilitiesResponse, &service.Vulnerability{
			Name:        v.Check,
			Description: v.Description,
			Severity:    v.Severity,
		})
	}

	return &service.AuditResponse{Vulnerabilities: vulnerabilitiesResponse}, nil
}
