#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("Docker Build and run Ansible container" "Docker Build and run Terraform container" "Show Docker images" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Docker Build and run Ansible container")
            echo "you chose Ansible"
            docker build -t ansible-container ~/DevOpsTT/dockerfile-ansible

            ;;
        "Docker Build and run Terraform container")
            echo "you chose Terraform"
            docker build -t terraform-container ~/DevOpsTT/dockerfile-ansible

            ;;
        "Show Docker images")
            echo "you chose Docker images"
            Docker images
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done