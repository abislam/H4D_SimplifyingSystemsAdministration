###############################################V-72279#############################################

cat << inV72279
--------------------In V-72279 Script-------------------
The shosts.equiv files are used to configure host-based authentication for the system via SSH. 
Host-based authentication is not sufficient for preventing unauthorized access to the system, 
as it does not require interactive identification and authentication of a connection request, or for the use of two-factor authentication.
inV72279

sequiv="$(find / -name shosts.equiv)"
echo $sequiv
if [[ $sequiv == "" ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Remove any found 'shosts.equiv' files from the system"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72279
--------------------Out V-72279 Script-------------------
outV72279
