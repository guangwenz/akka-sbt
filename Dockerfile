# https://github.com/guangwenz/akka-sbt

# Pull base image
FROM openjdk:8-slim

# Env variables
ENV SCALA_VERSION 2.12.6
ENV SBT_VERSION 1.1.6

RUN \
    apt-get update && apt-get -y install \
    curl \
    sed \
    unzip

# Scala expects this file
RUN touch /usr/lib/jvm/java-8-openjdk-amd64/release

# Install Scala
## Piping curl directly in tar
RUN \
  curl -fsL https://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo "export PATH=~/scala-$SCALA_VERSION/bin:$PATH" >> /root/.bashrc

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get install sbt && \
  sbt sbtVersion && \
  rm -rf /var/lib/apt/lists/*

# Copy ivy cache, run runfirst.sh to copy it from $HOME/.ivy2 first!
COPY ivy-cache/ /root/.ivy2

# Define working directory
WORKDIR /app