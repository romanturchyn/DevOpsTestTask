################################
# Pull base image
################################

FROM ubuntu:latest

################################
# Package install
################################

RUN \
# Update
apt update -y && \
# Install tar archive
apt install tar -y && \
# need wget
apt install wget -y && \
# nano
apt install nano -y && \
# GIT
apt install git -y

################################
# Install python
################################

RUN apt-get install -y python3-pip
#RUN ln -s /usr/bin/python3 python
RUN pip3 install --upgrade pip
RUN python3 -V
RUN pip --version

################################
# Install Ansible
################################

# Makes the temporary Ansible directory
RUN mkdir /etc/ansible /ansible

#Downloads Ansible from sourceurl
RUN \
  wget https://releases.ansible.com/ansible/ansible-latest.tar.gz
# Extracts Ansible from the tar file
RUN \
  tar -xzf ansible-latest.tar.gz -C ansible --strip-components 1 && \
  rm -fr ansible-latest.tar.gz /ansible/docs /ansible/examples /ansible/packaging

################################
# Install AWS CLI
################################
RUN pip install awscli --upgrade --user

# add aws cli location to path
ENV PATH=~/.local/bin:$PATH

################################
# Volume creation
################################
RUN mkdir /ansible-playbooks
VOLUME /ansible-playbooks

RUN mkdir /aws-credentials
VOLUME /aws-credentials


# Sets environment variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_SSH_PIPELINING True
ENV PATH /ansible/bin:$PATH
ENV PYTHONPATH /ansible/lib