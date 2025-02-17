## Jenkins Operations

- Run Jenkins Master

```
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-master jenkins/jenkins

```
- Get initial password

```
docker exec -it <container_id/name>  /bin/bash

cat /var/jenkins_home/secrets/initialAdminPassword
or 
cat /var/jenkins/secrets/initialAdminPassword
or 
cat /var/lib/jenkins/secrets/initialAdminPassword
``` 
## Jenkins Folders

```

codes : /var/lib/jenkins


```

## Install Jenkins on UBUNTU

```
sudo apt update

sudo apt install openjdk-17-jdk -y

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get install jenkins -y

```


# How to connect Github and Jenkins:
- Tokens
- SSH


[Video link](https://www.youtube.com/watch?v=HSA_mZoADSw)




# SLACK INTERGRATIONS:
[LINK](https://my.slack.com/services/new/jenkins-ci)