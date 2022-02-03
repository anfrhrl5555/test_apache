FROM tomcat
ADD ./* /usr/local/tomcat
WORKDIR /usr/local/tomcat/bin
ENTRYPOINT ["/bin/bash", "./shutdown.sh", "./startup.sh"]
EXPOSE 8080
