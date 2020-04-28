FROM tomcat:8.5.50-jdk8-openjdk
LABEL NAME="WEB"
WORKDIR /usr/local/tomcat/
COPY web*.war webapps/web.war
#Copying the setenv.sh and contenxt.xml to respective tomcat folders.
COPY tomcat/ .
#Starting tomcat
#CMD ./bin/startup.sh && tail -f /dev/null
#Starting tomcat using cataina.sh. In a Docker container we want the output to output to a stdout and then docker can catch that and 
#treat it as a log. Thats why we need catalina.sh which is a low level script that directly runs tomcat and all of the output will 
#go to standard output.
CMD ["./bin/catalina.sh", "run"]
#CMD ["./bin/catalina.sh", "jpda start"]