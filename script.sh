#!/bin/bash
#Written by Roman Turchyn 2021

echo "Hello! This is a script for build docker images and automatically run Docker containers"
echo "To date, we have two different choices - Ansible and Terraform containers"
PS3='Please enter your choice: '
options=("Docker Build and run Ansible container" "Docker Build and run Terraform container" "Show Docker images" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Docker Build and run Ansible container")
            echo "you chose Ansible"
            docker build -t ansible-docker ~/DevOpsTestTask/dockerfile-ansible && \
            docker run -ti -v ~/DevOpsTestTask/dockerfile-ansible/ansible:/ansible --name ansible ansible-docker bash

            ;;
        "Docker Build and run Terraform container")
            echo "you chose Terraform"
            docker build -t terraform-docker ~/DevOpsTestTask/dockerfile-terraform && \
            docker run -ti -v ~/DevOpsTestTask/dockerfile-terraform/terraform:/terraform --name terraform terraform bash

            ;;
        "Show Docker images")
            echo "you chose Show Docker images"
            Docker images
            ;;
        "Quit, BYE!")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done