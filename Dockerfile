# Use Node.js as the base image
FROM node:20

RUN apt-get update && apt-get install -y git && apt-get clean

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the Hexo project files
COPY . .

# Install Hexo CLI globally
RUN npm install -g hexo-cli

#install hexo deploy.
RUN npm install hexo-deployer-git --save

# Generate the static files
RUN hexo generate


# Expose port 4000 (if you want to run the server)
EXPOSE 4000

