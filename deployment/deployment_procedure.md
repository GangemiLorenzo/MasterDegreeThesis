# Deployment Process

## Step 1: Provisioning the Server

The first step in the deployment process is setting up a server to host the web frontend and the backend microservices. For this project, a **DigitalOcean Droplet** was chosen.

### Accessing the Droplet:
After the droplet is provisioned, it can be accessed via SSH using the credentials provided by DigitalOcean:
```bash
ssh root@<droplet_ip>
```

## Step 2: Building the Go Services

The process of building the Golang services was automated using a GitHub Actions pipeline. This pipeline is responsible for compiling and packaging the binaries for deployment.

### Overview of the Pipeline:
- **Location**: The pipeline is defined in the `.github/workflows/build_and_release.yaml` file.
- **Purpose**: It builds the following Golang microservices:
  - Codec
  - Assistant
  - Auditor
  - BFF (Backends-for-Frontends)
- **Process**:
  - Each service is built sequentially to respect interdependencies.
  - The compiled binaries for each service are uploaded as artifacts.
  - A GitHub release is generated at the end, containing all the compiled binaries.

### Outcome:
The pipeline generates the binaries for all services, which are then ready for deployment to the server.


## Step 3: Building the Frontend

The web frontend in Flutter, is built locally before deployment. The process involves configuring the environment and generating the necessary build files.

### Process:
1. **Configure Environment**: 
   - Update the `editor/.env` file to set the `BASE_URL` and `API_PATH` to match the server's configuration (e.g., the DigitalOcean droplet).
   
2. **Generate Files**:
   - Run the command `make build_runner` to generate files based on the updated environment configuration.

3. **Build the Frontend**:
   - Execute the following command to build the web frontend for release:
     ```bash
     flutter build web --release
     ```
   - This creates the release-ready web files, which are output to the `build/web` directory.

### Outcome:
The build process produces the frontend files, ready to be deployed to the server.

## Step 4: Setting Up and Uploading the Services

Each Golang service is uploaded and set up on the server, starting with the Codec service.

### Codec Service Setup:
1. **Prepare Local Files**:
   - Create a folder named `codec` inside an `output/` directory (e.g., `output/codec`).
   - Place the `codec_service` binary (downloaded from the GitHub Actions pipeline) into the `output/codec` folder.
   - Add a `.env` file to the folder with the necessary configuration, including the `GRPC_PORT`.
   - Copy the `contracts` folder from the project directory (`codec/internal/contracts`) into the `output/codec` folder. This folder is required for the setup checks performed by the service.

2. **Upload to the Droplet**:
   - Use the following `scp` command to upload the `output/codec` folder to the server:
     ```bash
     scp -r output/codec root@<droplet_ip>:/path/to/deployment/
     ```
   - Replace `<droplet_ip>` with the IP address of the droplet and `/path/to/deployment/` with the desired directory on the server.

### Outcome:
The `output/codec` folder is uploaded to the server, ensuring no confusion with the project directory structure.

### Auditor Service Setup:
1. **Prepare Local Files**:
   - Create a folder named `auditor` inside an `output/` directory (e.g., `output/auditor`).
   - Place the `auditor_service` binary (downloaded from the GitHub Actions pipeline) into the `output/auditor` folder.
   - Add a `.env` file to the folder with the necessary configuration, including any required environment variables.
   - Copy the `contract` folder from the project directory (`auditor/internal/contract`) into the `output/auditor` folder.
   - Create an empty folder named `reports` inside the `output/auditor` folder. This folder is used to store reports generated by the service.

2. **Upload to the Droplet**:
   - Use the following `scp` command to upload the `output/auditor` folder to the server:
     ```bash
     scp -r output/auditor root@<droplet_ip>:/path/to/deployment/
     ```
   - Replace `<droplet_ip>` with the IP address of the droplet and `/path/to/deployment/` with the desired directory on the server.

### Outcome:
The `output/auditor` folder, containing the necessary files and directories (including `contract` and `reports`), is uploaded to the server. 


### Assistant Service Setup:
1. **Prepare Local Files**:
   - Create a folder named `assistant` inside an `output/` directory (e.g., `output/assistant`).
   - Place the `assistant_service` binary (downloaded from the GitHub Actions pipeline) into the `output/assistant` folder.
   - Add a `.env` file to the folder with the necessary configuration, including any required environment variables.
   - Copy the input and setup prompt text files from the project directory (`ai_assistant`) into the `output/assistant` folder. The required files are:
     - `input_link_prompt.txt`
     - `input_prompt.txt`
     - `input_warning_prompt.txt`
     - `setup_link_prompt.txt`
     - `setup_prompt.txt`
     - `setup_warning_prompt.txt`

2. **Upload to the Droplet**:
   - Use the following `scp` command to upload the `output/assistant` folder to the server:
     ```bash
     scp -r output/assistant root@<droplet_ip>:/path/to/deployment/
     ```
   - Replace `<droplet_ip>` with the IP address of the droplet and `/path/to/deployment/` with the desired directory on the server.

### Outcome:
The `output/assistant` folder, containing the binary, `.env` file, and all necessary prompt text files, is uploaded to the server.


### BFF Service Setup:
1. **Prepare Local Files**:
   - Create a folder named `server` inside an `output/` directory (e.g., `output/server`).
   - Place the `server_service` binary (downloaded from the GitHub Actions pipeline) into the `output/server` folder.
   - Add a `.env` file to the folder containing the configuration for:
     - The gRPC ports of the other microservices (Codec, Auditor, and Assistant).
     - The REST API port for the BFF service.
     - The server's IP address.
   - Create an empty folder named `tasks` inside the `output/server` folder. This folder is used for task management by the service.

2. **Upload to the Droplet**:
   - Use the following `scp` command to upload the `output/server` folder to the server:
     ```bash
     scp -r output/server root@<droplet_ip>:/path/to/deployment/
     ```
   - Replace `<droplet_ip>` with the IP address of the droplet and `/path/to/deployment/` with the desired directory on the server.

### Outcome:
The `output/server` folder, containing the binary, `.env` file, and the `tasks` folder, is uploaded to the server. 

## Step 5: Starting the Services

After uploading all the required files, the next step is to start the services on the droplet.

### Process:
1. **Access the Droplet**:
   - SSH into the droplet using the following command:
     ```bash
     ssh root@<droplet_ip>
     ```
   - Replace `<droplet_ip>` with the IP address of the droplet.

2. **Navigate to the Services Location**:
   - Change the directory to the location where the services were uploaded:
     ```bash
     cd /path/to/deployment/
     ```

3. **Set Executable Permissions**:
   - Ensure that each service binary has the correct permissions to execute:
     ```bash
     chmod +x codec/codec_service
     chmod +x auditor/auditor_service
     chmod +x assistant/assistant_service
     chmod +x server/server_service
     ```

4. **Start the Services**:
   - Use the `start_services.sh` script located in the project under the `deployment/` folder. This script:
     - Starts each service.
     - Redirects the output of each service to a `.log` file for monitoring.
   - Run the script:
     ```bash
     ./deployment/start_services.sh
     ```

5. **Monitor the Logs**:
   - Check the `.log` files to ensure the services are running correctly:
     ```bash
     tail -f codec/codec_service.log
     tail -f auditor/auditor_service.log
     tail -f assistant/assistant_service.log
     tail -f server/server_service.log
     ```

### Outcome:
If everything is set up correctly, the services will start, and their output will be printed to the respective log files, indicating that they are running successfully.


## Step 6: Deploying the Frontend

To serve the web frontend, the built files are uploaded to the server and Nginx is configured to serve them.

### Process:
1. **Upload the Web Files**:
   - After building the frontend (`flutter build web --release`), upload the `editor/build/web` folder to the droplet using `scp`:
     ```bash
     scp -r editor/build/web root@<droplet_ip>:/var/www/frontend/
     ```
   - Replace `<droplet_ip>` with the IP address of the droplet. The files will be placed in `/var/www/frontend/` on the server.

2. **Install Nginx**:
   - SSH into the droplet:
     ```bash
     ssh root@<droplet_ip>
     ```
   - Update the package list and install Nginx:
     ```bash
     sudo apt update
     sudo apt install nginx
     ```

3. **Configure Nginx**:
   - Create a new Nginx configuration file for the frontend:
     ```bash
     sudo nano /etc/nginx/sites-available/frontend
     ```
   - Add the following content to the file:
     ```nginx
     server {
         listen 80;
         server_name <droplet_ip>;

         root /var/www/frontend;
         index index.html;

         location / {
             try_files $uri /index.html;
         }

         location /api/ {
             proxy_pass http://127.0.0.1:8080/;
             proxy_http_version 1.1;
             proxy_set_header Upgrade $http_upgrade;
             proxy_set_header Connection 'upgrade';
             proxy_set_header Host $host;
             proxy_cache_bypass $http_upgrade;
         }

         error_page 404 /index.html;
     }
     ```
     - Replace `<droplet_ip>` with the IP address of the server.

4. **Enable the Configuration**:
   - Create a symbolic link to enable the configuration:
     ```bash
     sudo ln -s /etc/nginx/sites-available/frontend /etc/nginx/sites-enabled/
     ```

5. **Restart Nginx**:
   - Test the configuration for syntax errors:
     ```bash
     sudo nginx -t
     ```
   - Restart Nginx to apply the changes:
     ```bash
     sudo systemctl restart nginx
     ```

### Outcome:
The frontend files will be served at `http://<droplet_ip>` and will proxy API requests (e.g., `/api/`) to the BFF service running on port 8080.
