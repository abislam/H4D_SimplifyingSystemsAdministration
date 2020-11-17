###############################################V-71939#############################################

cat << inV71939
--------------------In V-71939 Script-------------------
Configuring this setting for the SSH daemon provides additional assurance that remote logon via SSH will require a password, even in the event of misconfiguration elsewhere.
inV71939

ssh="$(grep -i PermitEmptyPasswords /etc/ssh/sshd_config)"
if [[ $ssh == *"PermitEmptyPasswords no"* ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Add or correct the following line in '/etc/ssh/sshd_config':

PermitEmptyPasswords no"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   


cat << outV71939
--------------------Out V-71939 Script-------------------
outV71939
