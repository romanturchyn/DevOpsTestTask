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
# Install gnupg2 -y && \
apt install gnupg2 -y && \
# Install python3-pip
apt install python3-pip -y && \
# Install sshpass
apt install sshpass -y && \
# Install openssh-client
apt install openssh-client -y && \
# Install nano
apt install nano -y && \
# Install GIT
apt install git -y

# Clear cache
RUN rm -rf /var/lib/apt/lists/* && \
        apt clean

################################
# Install Ansible
################################
RUN python3 -m pip install --upgrade pip cffi && \
    pip install ansible==2.10.3 && \
    pip install mitogen ansible-lint jmespath && \
    pip install --upgrade pywinrm

################################
# Install AWS CLI
################################
RUN pip install awscli --upgrade --user
# add aws cli location to path
ENV PATH=~/.local/bin:$PATH

################################
# Volume creation
################################
#attach volume
RUN mkdir /ansible
VOLUME /ansible

################################
# Ansible environment creation files
################################

# Sets environment variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_SSH_PIPELINING True
ENV PYTHONPATH /ansible/lib
#Sets aliases
RUN echo 'alias av="ansible --version"' >~/.bash_aliases
RUN echo 'alias aap="ansible all -m ping"' >>~/.bash_aliases