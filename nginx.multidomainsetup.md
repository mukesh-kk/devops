# Frontend (React App) for crm.please.in
server {
    listen 80;
    server_name crm.please.in;

    location / {
        proxy_pass http://localhost:3000;  # Frontend running on port 3000
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

# Backend (Node.js API) for api.please.in
server {
    listen 80;
    server_name api.please.in;

    location / {
        proxy_pass http://localhost:5000;  # Backend running on port 5000
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

server {
    listen 80;
    server_name please.in;

    location / {
        proxy_pass http://localhost:9000;  # Backend running on port 5000
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}