FROM tomcat
ADD ROOT /usr/local/tomcat/webapps/ROOT/
WORKDIR /usr/local/tomcat/bin
RUN ./shutdown.sh && ./startup.sh
EXPOSE 8080
