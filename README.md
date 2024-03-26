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

#### Authentication and DB

Ideally if we consider proving some authentication and database features too, then the endpoints will also provide:

- Authentication
- Saving
- Loading

This implementation could open the road for sharing functionalities.

### Codec microservice

The Codec will be a Golang microservice.
It will be running a GRPC server, ready to receive requests from the Main Server.

The adavantages of separating this component relies in its heavy load task which can then be escalated freely.

The GRPC endpoints will provide access to the codec functionalities.

- Encoding
  - A smart contract is received as string, it's analysed, and finally a JSON structure is produced.
- Decoding
  - A JSON structure is received, it is then decoded back to a smart contract, following some defined coding standard.

Here two challenges arise.
The first one reguards the conding end encoding opretaions.
The identified approaches to this problem are two:

- A regex based parser that scans the contract line by line
- A LLM (AI) agent that produces the JSON from the contract

The first one is harder to implement, but once tested and running it would be faster, cheaper and probably more reliable.
The second one will be easier to implement using some LLM APIs available on the market. Still the agent needs to be prepared for the task, the operation would require some async operation to run and it will cost an amount of money.

Considering an high load of operations, the first approach would be the favourite one.

#### LLM Support microservice

Still the LLM could be helpful in describing the JSON structures obtained, and commenting the resulting code.

This support operation could be implemented over a different microservice, or inside the codec itself.

The second microservice approach could be usefull as it would expose the functionality to other uses other than simply coding/encoding.
Again the scaling advantage is present too.

### Editor Client

The Client will be implement as a Flutter single page application.
It will support Desktop and Web environment.

The interface will be composed by:

- Graph like editor
- Genetal and contract settings
- Node specific settings

The most complex blocks should behave like blackbox composed of input and outputs.
The content shuld be described by the LLM service and therefore easy to understand.
A way to edit the code would be needed in case the user wants to access it.

The editor will be responsible for taking the JSON structure received and rapresenting it graphically.

Finally, after changes are applied, the client can request the server to produce a smart contract out of the updated JSON.
