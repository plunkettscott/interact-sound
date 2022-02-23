FROM hyness/spring-cloud-config-server:3.1.0
RUN cp /etc/secrets/application.yml /config/application.yml