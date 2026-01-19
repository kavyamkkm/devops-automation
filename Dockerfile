FROM jenkins/inbound-agent:latest
# Install additional tools or dependencies if needed
RUN apt-get update && apt-get install -y maven
# Verify Java version (Java 11 is default)
CMD ["java", "-version"]
