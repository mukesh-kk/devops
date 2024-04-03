## Jenkins Operations

- Run Jenkins Master

```
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-master jenkins/jenkins

```
- Get initial password

```
docker exec -it <container_id/name>  /bin/bash

cat /var/jenkins_home/secrets/initialAdminPassword

``` 