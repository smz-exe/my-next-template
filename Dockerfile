FROM node:23-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
  git bash curl \
  && rm -rf /var/lib/apt/lists/*

# First copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the files
COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]