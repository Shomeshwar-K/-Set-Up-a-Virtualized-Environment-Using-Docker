![image](https://github.com/user-attachments/assets/c18c802e-88a5-4eff-ab07-3bd843d04b38)# Virtualized Environment with Docker on AWS EC2

To set up a containerized environment using Docker on an AWS EC2 instance. The container will run a simple service (e.g., Nginx web server) to showcase how to use Docker for virtualization

## Technologies Used
- AWS account with EC2 access
- Docker installed on an AWS EC2 instance
- Basic knowledge of using the terminal and Git
- GitHub account

---

### Create an AWS EC2 Instance
1.	Go to the AWS EC2 Dashboard.
2.	Launch a new EC2 instance with the Ubuntu AMI .
3. Choose the t2.micro instance type (eligible for the AWS free tier).
4. Configure the security group:
      - Add inbound rules to allow access to:
         - HTTP (port 80) from specific IP address or range (e.g., 0.0.0.0/0 for open access, or x.x.x.x/32 for a specific IP).
         - HTTPS (port 443) from specific IP address or range.
         - SSH (port 22) only from trusted IPs (e.g., your IP or a restricted range like x.x.x.x/32 to ensure secure access).
5. Download the SSH key pair to connect to the EC2 instance securely.
6. Connect to the instance using PuTTY with the downloaded SSH key pair.
![image](https://github.com/user-attachments/assets/7eb06bd6-b1cc-4a8c-b65b-d7a4ef096307)

### Install Docker on your EC2 instance
1.  Instaliing docker to run the nginx web server
2.  Steps to install Docker
    ```bash
    sudo apt update 
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
![image](https://github.com/user-attachments/assets/651a05a8-b6f7-494a-b2a0-67bed6775d18)


## Create a Dockerfile 
1. Create a directory to store the dockerfile and html file.
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
![image](https://github.com/user-attachments/assets/aeaa3493-2ebc-47b5-952c-033967c74028)

---

## Build and Run the Docker image

- In the directory with Dockerfile run the following commands
  ```bash
  sudo docker build -t webserver-nginx .
  sudo docker run -d -p 8080:80 --name docker

![image](https://github.com/user-attachments/assets/721d38c4-be8d-456a-8c81-8166379a46d6)


### Navigate to Web Directory 
1.  Go to `/var/www/html`, the default directory for Apache.
2.  Clone the above git repository.
3.  Restart apache2  
    ```bash
    cd /var/www/html
    git clone https://github.com/Shomeshwar-K/Deploy-a-Simple-Web-Application.git
    sudo systemctl restart apache2
![image](https://github.com/user-attachments/assets/9de5dbf0-e05b-46a8-8279-af126691400f)

## Running Nginx Web Server

1.   Obtain the Public IP of Your EC2 Instance
2.   Access the Web Server with the public IP address and the port number.
   
- Note: **Stopping** and **Starting** the EC2 instance, will change the Public IP address . Be sure to obtain the new public IP address if you need to access the app again after a Start.

![image](https://github.com/user-attachments/assets/630bdc59-e11d-4634-bdfe-d3f57ac1ecf4)



