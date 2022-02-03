FROM tomcat
ADD ./* /usr/local/tomcat
WORKDIR /usr/local/tomcat/bin
RUN ["/bin/bash", "./shutdown.sh", "./startup.sh"]
EXPOSE 8080
