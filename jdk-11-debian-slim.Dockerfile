# A JDK 11 with Debian slim
# docker image build -t jdk-11-debian-slim -f jdk-11-debian-slim.Dockerfile .
# docker container run -m=200M -it --rm jdk-11-debian-slim
# --rm: Automatically remove the container when it exits
# -i: --interactive                    Keep STDIN open even if not attached
# -t: --tty                            Allocate a pseudo-TTY
# docker container run -m=200M -it --rm jdk-11-debian-slim java --list-modules
# docker container run -m=200M -it --rm jdk-11-debian-slim java --list-modules | wc -l
# 70 modules
FROM debian:stable-slim
# wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
# ADD https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz /opt
ADD openjdk-11.0.2_linux-x64_bin.tar.gz /opt
# Set up env variables
ENV JAVA_HOME=/opt/jdk-11.0.2
ENV PATH=$PATH:$JAVA_HOME/bin
CMD ["jshell"]