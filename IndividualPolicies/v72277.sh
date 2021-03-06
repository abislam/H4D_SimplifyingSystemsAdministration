###############################################V-72277#############################################

cat << inV72277
--------------------In V-72277 Script-------------------
The .shosts files are used to configure host-based authentication for individual users or the system via SSH. 
Host-based authentication is not sufficient for preventing unauthorized access to the system, as it does not 
require interactive identification and authentication of a connection request, or for the use of two-factor authentication.
inV72277

shots="$(find / -name '*.shosts')"
echo $shots
if [[ $shots == "" ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Remove any found '.shosts' files from the system"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72277
--------------------Out V-72277 Script-------------------
outV72277
