# Use an official Nginx runtime as the base image
FROM nginx:alpine

# Copy the website files from the local directory to the container
COPY . /usr/share/nginx/html

# Expose port 80 to allow outside access to the website
EXPOSE 80

# Command to start Nginx and serve the website
CMD ["nginx", "-g", "daemon off;"]
