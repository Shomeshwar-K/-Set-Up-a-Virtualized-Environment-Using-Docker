# Virtualized Environment with Docker on AWS EC2

## Objective

To set up a containerized environment using Docker on an AWS EC2 instance. The container will run a simple service (e.g., Nginx web server) to showcase how to use Docker for virtualization

## Prerequisites
- AWS account with EC2 access
- Docker installed on an AWS EC2 instance
- Basic knowledge of using the terminal and Git
- GitHub account

---

### Create an AWS EC2 Instance
1. Go to the AWS EC2 Dashboard.
2. Launch a new EC2 instance with the Ubuntu AMI .
3. Choose the t2.micro instance type (eligible for the AWS free tier).
4. Configure the security group:
      - Add inbound rules to allow access to:
         - HTTP (port 80) from specific IP address or range (e.g., 0.0.0.0/0 for open access, or x.x.x.x/32 for a specific IP).
         - HTTPS (port 443) from specific IP address or range.
         - Custom TCP (port 8080) from specific IP address or range.
         - SSH (port 22) only from trusted IPs (e.g., your IP or a restricted range like x.x.x.x/32 to ensure secure access).
5. Download the SSH key pair to connect to the EC2 instance securely.
6. Connect to the instance using PuTTY with the downloaded SSH key pair.
   
![image](https://github.com/user-attachments/assets/7eb06bd6-b1cc-4a8c-b65b-d7a4ef096307)

### Install Docker on your EC2 instance
1.  Instaliing docker via convenience script(https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)
2.  Steps to install Docker
    ```bash
    sudo apt update 
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh

![image](https://github.com/user-attachments/assets/651a05a8-b6f7-494a-b2a0-67bed6775d18)

---

### Create a Dockerfile 
1. Create a directory to store the dockerfile and html file.
   ```bash
   mkdir Docker-nginx
   cd Docker-nginx
2. The Dockerfile will define the environment and how to run the service inside the container.
   
![image](https://github.com/user-attachments/assets/9edce357-4028-4728-a8e3-0f3a3f0ca9af)


### 1. Initialize a Git Repository and Push Files to GitHub

1. Open the directory with Dockerfile.
2. Run the following commands to initialize a Git repository and commit your files:

   ```bash
   git init
   git add .
   git commit -m "Initial commit"
3. Run the following command to push the files to Git repository:
   ```bash
   git remote add origin https://github.com/Shomeshwar-K/Docker-nginx.git
   git push -u origin main

---

## Build and Run the Docker image

1. In the directory with Dockerfile run the following commands
   ```bash
   sudo docker build -t webserver-nginx .
   sudo docker run -d -p 8080:80 --name nginx-docker webserver-nginx
2. Run the following coomand to check the docker container is running:
   ```bash
   sudo docker ps

![image](https://github.com/user-attachments/assets/721d38c4-be8d-456a-8c81-8166379a46d6)

 
## Running Nginx Web Server

1.   Once the container is running, open a web browser and go to the assigned public IP of the instance with port number.
2.   You should see a page with the message "Welcome to the Dockerized Nginx Web Server!".
   
- Note: **Stopping** and **Starting** the EC2 instance, will change the Public IP address . Be sure to obtain the new public IP address if you need to access the app again after a Start.

![image](https://github.com/user-attachments/assets/630bdc59-e11d-4634-bdfe-d3f57ac1ecf4)



