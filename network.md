## see open ports

```
netstat -antp
ss -tunlp

```
## see ip add 

```
ip addr show  

ifconfig

```

## check connection 

```
ping <ip>

```
## scan other server open ports

```
nmap <ip>


ufw status verbose

```

## dns lookup

```

dig <domain>
nplookpup <domain>

```

##  routes and gateways 

```

route -n
route

```
## see amc address of each interface

```

arp

```

## trace a request 

```
mtr <domain|ip>

```

## check if port is open and connect 

```

telnet  <ip > <port>

```