FROM tomcat:latest

COPY SWE645HW1.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]