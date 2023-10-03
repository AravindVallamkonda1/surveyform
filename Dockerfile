FROM tomcat:10.1-jdk11-openjdk

COPY SWE645HW1.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]