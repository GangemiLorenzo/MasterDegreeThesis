package ai_assistant_utils

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/sashabaranov/go-openai"
	"github.com/sashabaranov/go-openai/jsonschema"
)

type AiAssistantUtils struct {
	openAiClient openai.Client
	dialogue     []openai.ChatCompletionMessage
	tools        []openai.Tool
}

func NewAiAssistantUtils(openAiClient openai.Client) *AiAssistantUtils {
	return &AiAssistantUtils{
		openAiClient: openAiClient,
		dialogue:     []openai.ChatCompletionMessage{},
		tools:        []openai.Tool{},
	}
}

type DescriptionFCResult struct {
	Items []DescriptionResult `json:"items"`
}

type DescriptionResult struct {
	Id          string `json:"id"`
	Description string `json:"description"`
}

func (scu *AiAssistantUtils) SetupAssistantDialog() error {

	item := jsonschema.Definition{
		Type: jsonschema.Object,
		Properties: map[string]jsonschema.Definition{
			"id": {
				Type:        jsonschema.String,
				Description: "The ID belonging to the element currently described, e.g. 058f661c-2c5e-4eed-ab92-72b102f19ee7, a47acf50-0907-4663-bb1f-38117a2a42f6",
			},
			"description": {
				Type:        jsonschema.String,
				Description: "The description of the element, e.g. \"Function to deposit 1 ether into the contract, updating the balance and potentially setting the winner.\", \"Function for the winner to claim all ether in the contract.\"",
			},
		},
		Required: []string{"id", "description"},
	}

	params := jsonschema.Definition{
		Type: jsonschema.Object,
		Properties: map[string]jsonschema.Definition{
			"items": {
				Type:  jsonschema.Array,
				Items: &item,
			},
		},
	}

	f := openai.FunctionDefinition{
		Name:        "set_description_by_id",
		Description: "Set the description to the element with the given ID.",
		Parameters:  params,
	}
	t := openai.Tool{
		Type:     openai.ToolTypeFunction,
		Function: &f,
	}
	instructions := readFileContent("setup_prompt.txt")
	scu.dialogue = []openai.ChatCompletionMessage{
		{
			Role:    openai.ChatMessageRoleUser,
			Content: instructions,
		},
	}
	scu.tools = []openai.Tool{t}
	resp, err := scu.openAiClient.CreateChatCompletion(
		context.Background(),
		openai.ChatCompletionRequest{
			Model:    openai.GPT3Dot5Turbo,
			Messages: scu.dialogue,
			Tools:    scu.tools,
		},
	)
	if err != nil || len(resp.Choices) != 1 {
		fmt.Printf("Completion error: err:%v len(choices):%v\n", err,
			len(resp.Choices))
		return err
	}
	msg := resp.Choices[0].Message
	if len(msg.ToolCalls) != 0 {
		fmt.Printf("Completion error: len(toolcalls): %v\n", len(msg.ToolCalls))
		return err
	}

	scu.dialogue = append(scu.dialogue, msg)

	return nil
}

func (scu *AiAssistantUtils) RunCommentProcess(sourceUnitJson string, code string) ([]DescriptionResult, error) {

	instructions := readFileContent("input_prompt.txt")
	instructions = strings.Replace(instructions, "<<SOLIDITY_CODE>>", code, -1)
	instructions = strings.Replace(instructions, "<<JSON_STRUCTURE>>", sourceUnitJson, -1)

	dialogue := []openai.ChatCompletionMessage{
		{
			Role:    openai.ChatMessageRoleUser,
			Content: instructions,
		},
	}
	inputDialogue := append(scu.dialogue, dialogue...)
	resp, err := scu.openAiClient.CreateChatCompletion(
		context.Background(),
		openai.ChatCompletionRequest{
			Model:    openai.GPT3Dot5Turbo,
			Messages: inputDialogue,
			Tools:    scu.tools,
			ToolChoice: &openai.ToolChoice{
				Type: openai.ToolTypeFunction,
				Function: openai.ToolFunction{
					Name: "set_description_by_id",
				},
			},
		},
	)
	if err != nil || len(resp.Choices) != 1 {
		fmt.Printf("Completion error: err:%v len(choices):%v\n", err,
			len(resp.Choices))
		return nil, err
	}
	msg := resp.Choices[0].Message
	if len(msg.ToolCalls) == 0 {
		fmt.Printf("Completion error: len(toolcalls): %v\n", len(msg.ToolCalls))
		return nil, err
	}

	fmt.Printf("Received %v tool calls\n", len(msg.ToolCalls))

	res := DescriptionFCResult{
		Items: []DescriptionResult{},
	}
	for _, toolCall := range msg.ToolCalls {
		f := toolCall.Function
		dr := f.Arguments
		r := DescriptionFCResult{}
		err := json.Unmarshal([]byte(dr), &r)
		if err != nil {
			fmt.Println("Error:", err)
			return nil, err
		}
		res.Items = append(res.Items, r.Items...)
	}

	return res.Items, nil
}

type LinkFCResult struct {
	Items []LinkResult `json:"items"`
}

type LinkResult struct {
	Start       string `json:"start"`
	End         string `json:"end"`
	Description string `json:"description"`
	Action      string `json:"action"`
}

func (scu *AiAssistantUtils) SetupLinkDialog() error {
	item := jsonschema.Definition{
		Type: jsonschema.Object,
		Properties: map[string]jsonschema.Definition{
			"start": {
				Type:        jsonschema.String,
				Description: "The ID of the source element. This is the element that the link starts from.",
			},
			"end": {
				Type:        jsonschema.String,
				Description: "The ID of the target element. This is the element that the link ends at.",
			},
			"description": {
				Type:        jsonschema.String,
				Description: "The description of the link, e.g. \"The function modifies the balance of the contract.",
			},
			"action": {
				Type:        jsonschema.String,
				Description: "The action that the link represents, e.g. \"modifies\", \"reads\", \"returns\" or others. For structural links just use \"relation\".",
			},
		},
		Required: []string{"type", "source", "target", "action"},
	}

	params := jsonschema.Definition{
		Type: jsonschema.Object,
		Properties: map[string]jsonschema.Definition{
			"items": {
				Type:  jsonschema.Array,
				Items: &item,
			},
		},
	}
	f := openai.FunctionDefinition{
		Name:        "set_relation",
		Description: "Creates a relation between two elements.",
		Parameters:  params,
	}
	t := openai.Tool{
		Type:     openai.ToolTypeFunction,
		Function: &f,
	}
	instructions := readFileContent("setup_link_prompt.txt")
	scu.dialogue = []openai.ChatCompletionMessage{
		{
			Role:    openai.ChatMessageRoleUser,
			Content: instructions,
		},
	}
	scu.tools = []openai.Tool{t}
	resp, err := scu.openAiClient.CreateChatCompletion(
		context.Background(),
		openai.ChatCompletionRequest{
			Model:    openai.GPT3Dot5Turbo,
			Messages: scu.dialogue,
			Tools:    scu.tools,
		},
	)
	if err != nil || len(resp.Choices) != 1 {
		fmt.Printf("Completion error: err:%v len(choices):%v\n", err,
			len(resp.Choices))
		return err
	}
	msg := resp.Choices[0].Message
	if len(msg.ToolCalls) != 0 {
		fmt.Printf("Completion error: len(toolcalls): %v\n", len(msg.ToolCalls))
		return err
	}

	scu.dialogue = append(scu.dialogue, msg)

	return nil
}

func (scu *AiAssistantUtils) RunLinkProcess(sourceUnitJson string, code string) ([]LinkResult, error) {

	instructions := readFileContent("input_link_prompt.txt")
	instructions = strings.Replace(instructions, "<<SOLIDITY_CODE>>", code, -1)
	instructions = strings.Replace(instructions, "<<JSON_STRUCTURE>>", sourceUnitJson, -1)

	dialogue := []openai.ChatCompletionMessage{
		{
			Role:    openai.ChatMessageRoleUser,
			Content: instructions,
		},
	}
	inputDialogue := append(scu.dialogue, dialogue...)
	resp, err := scu.openAiClient.CreateChatCompletion(
		context.Background(),
		openai.ChatCompletionRequest{
			Model:    openai.GPT3Dot5Turbo, //GPT3Dot5Turbo
			Messages: inputDialogue,
			Tools:    scu.tools,
			ToolChoice: &openai.ToolChoice{
				Type: openai.ToolTypeFunction,
				Function: openai.ToolFunction{
					Name: "set_relation",
				},
			},
		},
	)
	if err != nil || len(resp.Choices) != 1 {
		fmt.Printf("Completion error: err:%v len(choices):%v\n", err,
			len(resp.Choices))
		return nil, err
	}
	msg := resp.Choices[0].Message
	if len(msg.ToolCalls) == 0 {
		fmt.Printf("Completion error: len(toolcalls): %v\n", len(msg.ToolCalls))
		return nil, err
	}

	fmt.Printf("Received %v tool calls\n", len(msg.ToolCalls))

	res := LinkFCResult{
		Items: []LinkResult{},
	}
	for _, toolCall := range msg.ToolCalls {
		f := toolCall.Function
		dr := f.Arguments
		r := LinkFCResult{}
		err := json.Unmarshal([]byte(dr), &r)
		if err != nil {
			fmt.Println("Error:", err)
			return nil, err
		}
		res.Items = append(res.Items, r.Items...)
	}

	return res.Items, nil
}

type WarningFCResult struct {
	Items []WarningResult `json:"items"`
}

type WarningResult struct {
	Id string `json:"id"`
}

func (scu *AiAssistantUtils) SetupWarningDialog() error {
	item := jsonschema.Definition{
		Type: jsonschema.Object,
		Properties: map[string]jsonschema.Definition{
			"id": {
				Type:        jsonschema.String,
				Description: "The ID belonging to the element specified as a warning, e.g. 058f661c-2c5e-4eed-ab92-72b102f19ee7, a47acf50-0907-4663-bb1f-38117a2a42f6",
			},
		},
		Required: []string{"id"},
	}

	params := jsonschema.Definition{
		Type: jsonschema.Object,
		Properties: map[string]jsonschema.Definition{
			"items": {
				Type:  jsonschema.Array,
				Items: &item,
			},
		},
	}
	f := openai.FunctionDefinition{
		Name:        "set_warning",
		Description: "Identifies the functions which can be improved.",
		Parameters:  params,
	}
	t := openai.Tool{
		Type:     openai.ToolTypeFunction,
		Function: &f,
	}
	instructions := readFileContent("setup_warning_prompt.txt")
	scu.dialogue = []openai.ChatCompletionMessage{
		{
			Role:    openai.ChatMessageRoleUser,
			Content: instructions,
		},
	}
	scu.tools = []openai.Tool{t}
	resp, err := scu.openAiClient.CreateChatCompletion(
		context.Background(),
		openai.ChatCompletionRequest{
			Model:    openai.GPT3Dot5Turbo,
			Messages: scu.dialogue,
			Tools:    scu.tools,
		},
	)
	if err != nil || len(resp.Choices) != 1 {
		fmt.Printf("Completion error: err:%v len(choices):%v\n", err,
			len(resp.Choices))
		return err
	}
	msg := resp.Choices[0].Message
	if len(msg.ToolCalls) != 0 {
		fmt.Printf("Completion error: len(toolcalls): %v\n", len(msg.ToolCalls))
		return err
	}

	scu.dialogue = append(scu.dialogue, msg)

	return nil
}

func (scu *AiAssistantUtils) RunWarningProcess(sourceUnitJson string, code string) ([]WarningResult, error) {

	instructions := readFileContent("input_warning_prompt.txt")
	instructions = strings.Replace(instructions, "<<SOLIDITY_CODE>>", code, -1)
	instructions = strings.Replace(instructions, "<<JSON_STRUCTURE>>", sourceUnitJson, -1)

	dialogue := []openai.ChatCompletionMessage{
		{
			Role:    openai.ChatMessageRoleUser,
			Content: instructions,
		},
	}
	inputDialogue := append(scu.dialogue, dialogue...)
	resp, err := scu.openAiClient.CreateChatCompletion(
		context.Background(),
		openai.ChatCompletionRequest{
			Model:    openai.GPT3Dot5Turbo, //GPT3Dot5Turbo
			Messages: inputDialogue,
			Tools:    scu.tools,
			ToolChoice: &openai.ToolChoice{
				Type: openai.ToolTypeFunction,
				Function: openai.ToolFunction{
					Name: "set_warning",
				},
			},
		},
	)
	if err != nil || len(resp.Choices) != 1 {
		fmt.Printf("Completion error: err:%v len(choices):%v\n", err,
			len(resp.Choices))
		return nil, err
	}
	msg := resp.Choices[0].Message
	if len(msg.ToolCalls) == 0 {
		fmt.Printf("Completion error: len(toolcalls): %v\n", len(msg.ToolCalls))
		return nil, err
	}

	fmt.Printf("Received %v tool calls\n", len(msg.ToolCalls))

	res := WarningFCResult{
		Items: []WarningResult{},
	}
	for _, toolCall := range msg.ToolCalls {
		f := toolCall.Function
		dr := f.Arguments
		r := WarningFCResult{}
		err := json.Unmarshal([]byte(dr), &r)
		if err != nil {
			fmt.Println("Error:", err)
			return nil, err
		}
		res.Items = append(res.Items, r.Items...)
	}

	return res.Items, nil
}

func readFileContent(filename string) string {
	content, err := os.ReadFile(filename)
	if err != nil {
		log.Fatal("Error reading prompt file:", err)
	}
	return string(content)
}
