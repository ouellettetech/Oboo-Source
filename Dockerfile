FROM ubuntu:18.04
# Creates a Docker image that can be used to compile the Oboo Smart Clock build system
# See this link for more details: https://docs.docker.com/get-started/part2/

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bison \
    build-essential \
    ca-certificates \
    clang \
    curl \
    default-jdk \
    file \
    flex \
    g++ \
    gawk \
    gcc-multilib \
    gettext \
    git \
    git-core \
    libncurses5-dev \
    libssl-dev \
    libxml-parser-perl \
    python2.7 \
    python3 \
    python-dev \
    python-pip \
    quilt \
    rsync \
    subversion \
    sudo \
    swig \
    unzip \
    vim \
    wget \
    xsltproc \
    zlib1g-dev

RUN echo "Python Version: "
RUN python --version

ENV FORCE_UNSAFE_CONFIGURE 1

WORKDIR /build

#RUN mv sshKeys /root/.ssh && chown root /root/.ssh/*

CMD sh build.sh

