FROM ubuntu:22.04

MAINTAINER Joahannes Costa (joahannes@ic.unicamp.br)
LABEL Description="Dockerised Simulation of Urban MObility (SUMO)"

ENV SUMO_VERSION 1.18.0
ENV SUMO_USER joahannes

ENV SUMO_HOME /opt/sumo

# Install system dependencies.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install \
    wget \
    g++ \
    python3 \
    cmake \
    libxerces-c-dev \
    libfox-1.6-0 libfox-1.6-dev \
    libgdal-dev  \
    libproj-dev \
    libgl2ps-dev \
    python3-dev \
    libeigen3-dev \
    python2.7 \
    swig

# Download and extract source code
RUN wget https://sourceforge.net/projects/sumo/files/sumo/version%20$SUMO_VERSION/sumo-src-$SUMO_VERSION.tar.gz
RUN tar xzf sumo-src-$SUMO_VERSION.tar.gz && \
    mv sumo-$SUMO_VERSION $SUMO_HOME && \
    rm sumo-src-$SUMO_VERSION.tar.gz

# Configure and build from source.
RUN cd $SUMO_HOME && \
    mkdir build/cmake-build && \
    cd build/cmake-build && \
    cmake ../.. && \
    make -j$(nproc)

RUN adduser $SUMO_USER --disabled-password

# Set the entry point to start a shell session
# CMD ["/bin/bash"]