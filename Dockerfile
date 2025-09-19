# Use official Tomcat with JDK 17
FROM tomcat:9.0-jdk17

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR as ROOT.war
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Copy custom server.xml (uses ${PORT} for Render)
COPY tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml

# Expose default Tomcat port (Render remaps it)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
