
# 301270 - Software Engineer - Thesis 

This project contains my Software Engineer Master's Thesis project.

The result we wanted to obtain was to provide a tool that allows the user to read and modify the content of a Solidity smart contract.

All of it while being supported by an LLM and receiving vulnerability warnings.


## Development Setup

### Basic requirements
- The **Flutter environment** must be installed to be able to compile and run the client in the `./editor` folder and the package in the `./editor_grid` folder.
  - https://docs.flutter.dev/get-started/install

- Installing **Golang** is necessary for running the main server and each microservice.
  - https://go.dev/doc/install

### Client setup
- Move into the `./editor` folder, and run `make setup`. This command will execute a `pub get` for retriving the dependencies, then it will run a `build runner` command that generates the missing files.
- Same for the `./editor_grid` package. Running `make setup` will retrive the dependencies needed.
- At this point, if you are using VS-Code, the project contains a `launch.json` file, from which it is possible to launch the Editor. Otherwise, simply propmting `flutter run` in the terminal from the `./editor` should start the client.
In both this situation, you should be prompted to select the Desktop or Web client.


...

## Architecture

![Architecture structure from Figma](Architecture.png)

### Main Server

On the backend side we have a Golang service running:

- REST server
- GRPC client

The REST server is responsible for exposing endpoints to the client.
Through this APIs the client can:

- Submit a smart contract decoding request
- Receive the graphical rapresentation of the contract
- Request an encoding request
- Request updates due to local editing

#### Keeping the state

Database and Authentication are not implemented in the system.
The Main Server takes care of keeping the current state by a local storage of tasks, which are rapresented by a unique ID.

### Codec service

The Codec is Golang microservice.
It runs a GRPC server, ready to receive requests from the Main Server.

The adavantages of separating this component relies in its heavy load task which can then be escalated freely.

The GRPC endpoints provides access to the codec functionalities.

- Encoding
  - A smart contract is received as string, it's analysed, and finally a JSON structure is produced.
- Decoding
  - A JSON structure is received, it is then decoded back to a smart contract, following some defined coding standards.

The Parser/Lexer is implemented with the ANTLR language.

The parser logic and data structures are shared among the microservice through a package named `solidity_parser`.

### Assistant service

The AI Assistant is a Golang microservice.

It takes care of two tasks.

- The first one is to provide descriptions to the single elements obtained from the codec analysis.

- The second on is to create a list of functional relations.
Each of those describes how the single element interact with another element.

To do all of this, the microservice intaract with Chat GPT through the Open AI APIs and the user of the `go-openai` library.

This is currently the most time consuming operation and it requires the user to provide an API key with sufficent balance for the operation.

### Auditor service

The Auditor is a Golang microservice.

The scope of this service is to return the result of a vulnerability analysis over the provided smart contract code.

It does so by running a static analysis with `Slither`.
https://github.com/crytic/slither

The obtained results are then added beside the structure and provided back to the client for displaying.

### Editor Client

The Client is Flutter single page application.
It supports Desktop and Web environment.

The interface is by:

- A graph like editor for the contracts code.
- General settings page.
- A sidebar with the selected element properties.

The editor is responsible for taking the JSON structure received and rapresenting it graphically.

It also takes care of displaying the vulnerabilities.

Finally, after changes are applied, the client can request the server to produce a smart contract out of the updated JSON.
