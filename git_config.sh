#!/bin/bash

# Confiugres the username
echo -e "\e[32m[+]\e[36m CONFIGUREING GIT USERNAME\e[0m"
echo -e "\e[35mType your username\e[0m"
read username
git config --global user.name $username
echo -e "\e[32mUsername has been configured to \e[33m$username"

sleep 0.5

# Configures the email
echo -e "\e[32m[+]\e[36m CONFIGURING GIT EMAIL\e[0m"
echo -e "\e[35mType your email\e[0m"
read email
git config --global user.email $email
echo -e "\e[32mEmail has been configured to \e[33m$email"

sleep 0.5

# Configures the branch name
echo -e "\e[32m[+]\e[36m CONFIGURING DEFAULT GIT BRANCH\e[0m"
echo -e "\e[35mType the default branch name, default is main\e[0m"
read branch
git config --global init.default branch $branch
echo "Branch has been configured to \e[33m$branch"

sleep 0.5

