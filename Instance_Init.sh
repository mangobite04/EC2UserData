#!/bin/bash
# Owner: Devesh Kumar Rai
# Email: devesh.rai04@gmail.com
# Date: 25-03-2018
# Version: V1.0

yum remove java -y
yum install java-1.8.*-openjdk-headless.x86_64 -y
yum install java-1.8.*-openjdk-devel.x86_64 -y
yum install -y wget
yum install -y curl
cd /usr/local
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
/usr/bin/tar xzf apache-maven-3.5.2-bin.tar.gz
/usr/bin/ln -s apache-maven-3.5.2  maven
/usr/bin/echo export M2_HOME=/usr/local/maven > /etc/profile.d/maven.sh
/usr/bin/echo export PATH=${M2_HOME}/bin:${PATH} >> /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
rm -f /usr/local/apache-maven-3.5.2-bin.tar.gz
cd /root
git clone https://github.com/lc-nyovchev/opstest.git
cd /root/opstest
nohup ./mvnw spring-boot:run -Dspring.config.location=/root/opstest/src/main/resources/application.properties &