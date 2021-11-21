# Hello World with Java 11 and Docker

A simple maven project generated from the using `maven-archetype-quickstart`
(`org.apache.maven.archetypes:maven-archetype-quickstart:1.0`) and updated
to declare the maven compiler source and target for Java 11.

## Pre-requisites
Use jdk-11-debian-slim.Dockerfile from the parent directory to build the jdk-11-debian-slim image

## Build Images and Run Containers
Build the simple Java application with a local distribution of JDK 9:

    mvnw package

Build a Docker image containing the simple Java application based of the Docker
image `jdk-11-debian-slim`:

    docker build -t helloworld-jdk-11 -f helloworld-jdk-11.Dockerfile .

Run the java dependency tool `jdeps` on the application jar file:

    docker run -it --rm helloworld-jdk-11 jdeps --list-deps /opt/helloworld/helloworld-1.0-SNAPSHOT.jar

Create a custom Java runtime that is small and only contains the `java.base` module:
(See also the script `create-minimal-java-runtime.sh`):

    docker run --rm \
      --volume $PWD:/out \
      jdk-11-debian-slim \
      jlink --module-path /opt/jdk-11.02/jmods \
        --verbose \
        --add-modules java.base \
        --compress 2 \
        --no-header-files \
        --output /out/target/openjdk-11-base_linux-x64

Build a Docker image containing the simple Java application based of the Docker
image `debian:slim` and the custom Java runtime previous created:

    docker build -t helloworld-jdk-11-base -f helloworld-jdk-11-base.Dockerfile .

List the modules in custom Java runtime:

    docker run -it --rm helloworld-jdk-9-base java --list-modules

Run the docker images:

    docker run -it --rm helloworld-jdk-9

    docker run -it --rm helloworld-jdk-9-base

Compare sizes:

    docker images
