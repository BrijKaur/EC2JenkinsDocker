# EC2JenkinsDocker
This is a demo project to deploy a maven project called Caligraphy app on tomcat using jenkins and docker.
We are using an AWS EC2 Server as our Jenkins and Docker Server


1)	Select a free tier EC2 AMI : Linux

2)	In user commands enter (This installed all required softwares)
#!/bin/bash
sudo yum update -y
sudo yum install java-1.8.0-openjdk -y
sudo java -version
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y
sudo java -version
sudo service jenkins start
sudo yum install docker -y
sudo service docker start
sudo yum install maven -y
sudo service maven start
sudo yum install git -y
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker Jenkins

3)	The security group should have port 8080 for Jenkins and port 8081 for tomcat open to the world

4)	On localhost:8080/ put secret key and install default plugins for Jenkins

5)	Then create a new Jenkins Pipeline job 
Enable GitHub project and give URL
https://github.com/BrijKaur/EC2JenkinsDocker.git/

Also use option Pipeline script from SCM and same Git URL

6)	In Jenkins Global Tool Configuration add Maven home /usr/share/maven and docker home /var/lib/docker

7)	On the EC2 Instance 
sudo su –
tail /etc/passwd         (To check if jenkins user has /bin/bash)
usermod -s /bin/bash Jenkins
tail /etc/passwd         
cd /etc
vi sudoers
jenkins ALL=(ALL)       NOPASSWD:ALL       (Place this below the root entry to su jenkins without password)

8)Run the job on Jenkins and once use build timeout plugin to abort the build after 5 mins

9)Access the application on https://<EC2_public_IP>:8081/calligraphyapp/



