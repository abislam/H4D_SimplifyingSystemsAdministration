#!/bin/bash

###############################################V-71937#############################################

cat << inV71937
--------------------In V-71937 Script-------------------
If an account has an empty password, anyone could log on and run commands with the privileges of that account. 
Accounts with empty passwords should never be used in operational environments.
inV71937

nullok="$(grep nullok /etc/pam.d/system-auth /etc/pam.d/password-auth)"
if [[ $nullok == "" ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Remove any instances of the 'nullok' option in '/etc/pam.d/system-auth' and '/etc/pam.d/password-auth' to prevent logons with empty passwords."
    read -p "Make changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi


cat << outV71937
--------------------Out V-71937 Script-------------------
outV71937
