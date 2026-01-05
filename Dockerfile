# Use official Node.js image
FROM node:20-alpine

# Set working directory
WORKDIR /portfolioapp

# Install dependencies for SQLite
RUN apk add --no-cache python3 make g++ sqlite

# Copy package.json and package-lock.json first for caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# Build Strapi project
RUN npm run build

# Expose Strapi default port
EXPOSE 1339

# Start Strapi
CMD ["npm", "run", "start"]
