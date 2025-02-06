# Main types of Linux 

- RPM Based : RHEL , Centos , Oracle Linux

    installation: <code> rpm -ivh <-package name-> </code>

- Debian Based : Ubuntu , Kali 

    installation : <code> dpkg -i <-packege name-> </code>


# See Logs  of Systemd processes
```
 journalctl  -xeu <process> 
 journalctl -xeu jenkins.service | tail -50

```
# See General Logs

```
cat /var/logs/<process>

```
# SEE os config

```
cat /etc/os-release

```

# SSH Config

```
see and

cat /etc/ssh/sshd_config

apply

systemctl restart ssh 

```