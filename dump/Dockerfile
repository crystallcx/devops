# ARG DOCKER_REGISTRY
# FROM ${DOCKER_REGISTRY}/devops/docker-images/<org>/ubuntu:22

FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y apt-utils debconf-utils dialog
RUN echo 'debconf debconf/frontend select Noniteractive' | debconf-set-selections
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y \
    build-essential \
    cmake \
    curl \
    python3-pip \
    sudo

RUN apt-get install -y \
    openssh-client \
    git

#---
# # ARG SSH_PRIVATE_KEY

# # Authorize SSH Host
# RUN mkdir -p /root/.ssh && \
#     chmod 0700 /root/.ssh && \
#     ssh-keyscan github.com > /root/.ssh/known_hosts

# # Add the keys and set permissions
# RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa && \
#     chmod 600 /root/.ssh/id_rsa

# # RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
# #     echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
# #     chmod 600 /root/.ssh/id_rsa && \
# #     chmod 600 /root/.ssh/id_rsa.pub

# # Create known_hosts
# RUN touch /root/.ssh/known_hosts

# Avoid cache purge by adding requirements first
# ADD ./requirements.txt /app/requirements.txt

WORKDIR /app/

# RUN pip install -r requirements.txt

# # Remove SSH keys
# RUN rm -rf /root/.ssh/

# Add the rest of the files
ADD . .


# --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" --squash .
