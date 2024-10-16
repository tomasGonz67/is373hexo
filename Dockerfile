# Use Node.js as the base image
FROM node:20

# Set the Git user configuration
RUN git config --global user.email "tpg3@njit.edu" && \
    git config --global user.name "tomasGonz67"

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json.
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
RUN hexo clean

RUN hexo generate


# Expose port 4000 (if you want to run the server)
EXPOSE 4000

