# Frontend (React App) for crm.kick.in
server {
    server_name crm.kick.in;

    root /var/kick/kick-crm/dist;  # Path to admin build
    index index.html;                # default file to serve

    location / {
        try_files $uri /index.html;  # Try to serve the file or fallback to index.html
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/crm.kick.in/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/crm.kick.in/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}


# Backend (Node.js API) for api.kick.in
server {
    server_name api.kick.in;

    location / {
        proxy_pass http://localhost:5000;  # Backend running on port 5000
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/crm.kick.in/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/crm.kick.in/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
# Redirect HTTP to HTTPS for all subdomains
server {
    listen 80;
    server_name admin.kick.in crm.kick.in api.kick.in;

    return 301 https://$host$request_uri;
}
