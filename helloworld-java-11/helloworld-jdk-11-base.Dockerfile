# Hello world application with custom Java runtime with just the base module and Debian slim
# docker build -t helloworld-jdk-11-base -f helloworld-jdk-11-base.Dockerfile .
# docker run -it --rm helloworld-jdk-11-base
# docker run -it --rm helloworld-jdk-11-base java --list-modules
FROM debian:stable-slim
COPY target/openjdk-11-base_linux-x64 /opt/jdk-11.0.2
COPY target/helloworld-1.0-SNAPSHOT.jar /opt/helloworld/helloworld-1.0-SNAPSHOT.jar
# Set up env variables
ENV JAVA_HOME=/opt/jdk-11.0.2
ENV PATH=$PATH:$JAVA_HOME/bin
CMD java -cp /opt/helloworld/helloworld-1.0-SNAPSHOT.jar org.examples.java.App
