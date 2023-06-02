FROM jenkins/jenkins:lts

# Add custom plugins and install
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN ./bin/jenkins-plugin-cli < /usr/share/jenkins/ref/plugins.txt

# Copy config for CasC plugin
COPY jcasc/jenkins_casc.yaml /usr/share/jenkins/ref/jenkins.yaml

# Skip setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Setting permissions
USER root
RUN chown -R jenkins:jenkins /usr/share/jenkins/ref/
USER jenkins