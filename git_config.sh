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
echo -e "\e[32mBranch has been configured to \e[33m$branch"

sleep 0.5

# Configures the tokens
echo -e "\e[32m[+]\e[36m CONFIGURING CREDINETLS"
echo -e "\e[35mWould you like your token to be stored in ~/.git-credentials?"
read -p "(y/n): " tokenstore
if [[ $tokenstore == "y" || $tokenstore == "Y" ]]; then
	git config --global credential.helper store
	echo -e "\e[32mToken will be stored once you make a push\e[0m"
fi


