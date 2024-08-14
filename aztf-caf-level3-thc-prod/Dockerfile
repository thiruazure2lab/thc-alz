FROM jenkins/jenkins:lts

# Docker install
USER root
RUN echo "Acquire::http::Proxy \"$HTTP_PROXY\";" > /etc/apt/apt.conf
COPY https://artifactory-fs.group.net/artifactory/fs-generic-internal-local/truststore /opt/java/openjdk/jre/lib/security/cacerts
RUN chmod 644 /opt/java/openjdk/jre/lib/security/cacerts
RUN apt-get update && apt-get install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"
RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins
#HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "curl --fail http://localhost:3000 " ]
HEALTHCHECK NONE