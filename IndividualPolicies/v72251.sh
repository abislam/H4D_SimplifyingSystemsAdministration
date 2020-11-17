###############################################V-72251#############################################
cat << inV72251
--------------------In V-72251 Script-------------------
SSHv1 is an insecure implementation of the SSH protocol and has many well-known vulnerability exploits.
Exploits of the SSH daemon could provide immediate root access to the system. 
Satisfies: SRG-OS-000074-GPOS-00042, SRG-OS-000480-GPOS-00227
inV72251

 sshcheck="$(grep -i protocol /etc/ssh/sshd_config)"
if [[ $sshcheck == "Protocol 2" ]];
then
    echo "SSH is configured well"
else
    while true; do
    echo "It has to be 'Protocol 2'"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72251
--------------------Out V-72251 Script-------------------
outV72251
