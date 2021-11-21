# Hello world application with JDK 9 and Debian slim
# docker build -t helloworld-jdk-11 -f helloworld-jdk-11.Dockerfile .
# docker run -it --rm helloworld-jdk-11
# docker run -it --rm helloworld-jdk-11 jdeps --list-deps /opt/helloworld/helloworld-1.0-SNAPSHOT.jar
FROM jdk-11-debian-slim
COPY target/helloworld-1.0-SNAPSHOT.jar /opt/helloworld/helloworld-1.0-SNAPSHOT.jar
# Set up env variables
CMD java -cp /opt/helloworld/helloworld-1.0-SNAPSHOT.jar org.examples.java.App
