# Use official Tomcat with JDK 17
FROM tomcat:9.0-jdk17

# Install envsubst for variable substitution
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR as ROOT.war
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Copy custom server.xml as a template
COPY tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml.template

# Expose port (Render remaps this anyway)
EXPOSE 8080

# Replace ${PORT} at runtime and start Tomcat
CMD envsubst < /usr/local/tomcat/conf/server.xml.template > /usr/local/tomcat/conf/server.xml && catalina.sh run
