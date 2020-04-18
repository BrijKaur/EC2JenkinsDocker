FROM tomcat

MAINTAINER Brajender Kaur

COPY ./buildpackage/calligraphyapp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
