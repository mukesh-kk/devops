# Install certbot
```
sudo yum install certbot-nginx certbot

or

sudo apt update
sudo apt install certbot python3-certbot-nginx -y


```
# For Nginx
```
sudo certbot --nginx
or sudo certbot --nginx -d crm.bliall.in -d api.bliall.in

sudo crontab -e

```

## Updrade nginx conf

```
 # HTTPS server block
        listen 443 ssl http2;
        listen [::]:443 ssl http2;
        server_name shoggl.com www.shoggl.com;
        root /usr/share/nginx/html;

        # SSL configuration
        ssl_certificate /etc/letsencrypt/live/shoggl.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/shoggl.com/privkey.pem;
        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers HIGH:!aNULL:!MD5;
        ssl_session_cache shared:SSL:1m;
        ssl_session_timeout 10m;
        ssl_prefer_server_ciphers on;
        
```
