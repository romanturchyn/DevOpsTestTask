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
# Install Unzip
apt install unzip -y && \
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
# Install Terraform
################################

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_linux_amd64.zip

# Unzip
RUN unzip terraform_0.15.0_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version

################################
# Install AWS CLI
################################
RUN pip install awscli --upgrade --user

# add aws cli location to path
ENV PATH=~/.local/bin:$PATH

################################
# Volume creation
################################
RUN mkdir /terraform-resources
VOLUME /terraform-resources

RUN mkdir /aws-credentials
VOLUME /aws-credentials

################################
# Terraform environment creation files
################################

RUN touch /terraform-resources/ec2-creation.tf

#env variables
RUN export AWS_ACCESS_KEY_ID=/aws-credentials/access-key-id
RUN export AWS_SECRET_ACCESS_KEY=/aws-credentials/secret-access-key
RUN export AWS_DEFAULT_REGION=eu-central-1

#aliases
RUN echo 'alias tfi="terraform init"' >~/.bash_aliases
RUN echo 'alias tfp="terraform plan"' >>~/.bash_aliases
RUN echo 'alias tfa="terraform apply"' >>~/.bash_aliases
