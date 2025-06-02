# Use official Node.js image
FROM node:18

# Set the working directory
WORKDIR /nimbus

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the code
COPY . .

# Expose the port used by the app
EXPOSE 8081

# Start the app
CMD ["node", "index.js"]
