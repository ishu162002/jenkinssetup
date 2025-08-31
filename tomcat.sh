#!/bin/bash
#!/bin/bash
# Install Java
sudo yum update -y
sudo yum install -y java-17-amazon-corretto wget tar

# Download & extract Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.108/bin/apache-tomcat-9.0.108.tar.gz
tar -zxvf apache-tomcat-9.0.108.tar.gz
mv apache-tomcat-9.0.108 tomcat

# Configure Tomcat user properly
cat > tomcat/conf/tomcat-users.xml <<EOL
<tomcat-users>
    <role rolename="manager-gui"/>
    <role rolename="manager-script"/>
    <role rolename="manager-status"/>
    <user username="tomcat" password="admin@123" roles="manager-gui,manager-script,manager-status"/>
</tomcat-users>
EOL

# Allow external access by removing <Valve restriction>
sed -i '/Valve/d' tomcat/webapps/manager/META-INF/context.xml
sed -i '/Valve/d' tomcat/webapps/host-manager/META-INF/context.xml

# Start Tomcat
sh tomcat/bin/startup.sh

