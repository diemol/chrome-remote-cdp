FROM selenium/node-chrome-debug:latest

USER root

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && chmod -R 777 /var/log/nginx \
    && chmod -R 777 /var/run/ \
    && chmod -R 777 /var/lib/nginx \
    && chmod -R 777 /usr/share/nginx/ \
    && chmod -R 777 /tmp

COPY nginx.conf /etc/nginx/nginx.conf

USER seluser

#====================================
# Script to run ChromeDriver
#====================================
COPY start-chromedriver.sh /opt/bin/start-chromedriver.sh

#====================================
# Script to run ssh
#====================================
COPY start-chromedriver.sh /opt/bin/start-ssh.sh

#==============================
# Supervisor configuration file
#==============================
COPY selenium.conf /etc/supervisor/conf.d/

# WebDriver port
EXPOSE 4444
# VNC port
EXPOSE 5900
# CDP port
EXPOSE 9222