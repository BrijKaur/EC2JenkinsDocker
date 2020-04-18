FROM tomcat

MAINTAINER Brajender Kaur

COPY ./target/calligraphyapp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
