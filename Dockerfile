# Step 1: Use an official Nginx image as the base image
FROM nginx:alpine

# Step 2: Copy custom HTML file into the Nginx container (optional)
COPY index.html /usr/share/nginx/html/

# Step 3: Expose the port on which the web server will run
EXPOSE 80

# Step 4: Start the Nginx service (Nginx runs as the default command in the base image)
CMD ["nginx", "-g", "daemon off;"]
