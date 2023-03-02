FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y apt-utils debconf-utils dialog
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y \
    build-essential \
    cmake

RUN apt-get install -y \
    openssh-client \
    git

#---
# SSH forwarding
# Download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

# Clone private repository
RUN --mount=type=ssh git clone git@github.com:crystallcx/scribble_cpp.git scribble-cpp\
    && cd scribble-cpp && git submodule update --init --recursive

#--
