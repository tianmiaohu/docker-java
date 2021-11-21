#!/bin/sh

rm -fr target/openjdk-11-base_linux-x64

docker run --rm \
  --volume $PWD:/out \
  jdk-11-debian-slim \
  jlink --module-path /opt/jdk-11.02/jmods \
    --verbose \
    --add-modules java.base \
    --compress 2 \
    --no-header-files \
    --output /out/target/openjdk-9-base_linux-x64
