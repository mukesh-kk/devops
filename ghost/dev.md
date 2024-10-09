# DC yml

```
version: '3.3'

services:
  ghost:
    image: ghost:latest
    restart: always
    environment:
      NODE_ENV: development
      url: http://192.168.56.82:2368/blogs
    volumes:
      - ./ghost_content:/var/lib/ghost/content
    ports:
      - 2368:2368

```
# next js 

``` 
# Use an official Node.js image as the base
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json to install dependencies first
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the project files into the working directory
COPY . .

# Expose the port Next.js uses (3000 by default)
EXPOSE 3000

# Run Next.js in development mode
CMD ["npm", "run", "dev"]

```

# nginx   site-availalbe config (default)

```
server {
    listen 80;  # Adjust if you are using a different port

    location /blogs {
        proxy_pass http://localhost:2368;  # Forward requests to application on port 2368
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location / {
        proxy_pass http://localhost:3000;  # Forward all other requests to application on port 3000
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

```