###############################################V-72005#############################################
cat << inV72005
--------------------In V-72005 Script-------------------
If an account other than root also has a User Identifier (UID) of "0", it has root authority, 
giving that account unrestricted access to the entire operating system. 
Multiple accounts with a UID of "0" afford an opportunity for potential intruders to guess a password for a privileged account.
inV72005


rootcheck=$(awk -F: '$3 == 0 {print $1}' /etc/passwd)
if [[ $rootcheck == "root" ]];
then
    echo "root is the only account with UID of 0"
else
while true; do
    echo "Change the UID of any account on the system, other than root, that has a UID of '0'"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done       
fi

cat << outV72005
--------------------Out V-72005 Script-------------------
outV72005
