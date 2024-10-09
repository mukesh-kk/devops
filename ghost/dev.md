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