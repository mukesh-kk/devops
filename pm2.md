# Install pm2


```

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

sudo apt install -y nodejs

npm install -g pm2



```

# Start

```
directely(node)

pm2 start "< commmads node app.js >" --name "my-app"

or (with npm package json)

pm2 start npm --name="my-app" -- run <serve |start etc>

```

# stop restart delete

```
pm2 restart <id>
pm2 stop <id>
pm2 delete <id>

```