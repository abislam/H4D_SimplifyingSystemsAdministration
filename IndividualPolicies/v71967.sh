###############################################V-71967#############################################

cat << inV71967
--------------------In V-71967 Script-------------------
It is detrimental for operating systems to provide, or install by default, functionality exceeding requirements or mission objectives. 
These unnecessary capabilities or services are often overlooked and therefore may remain unsecured. 
They increase the risk to the platform by providing additional attack vectors. 
Operating systems are capable of providing a wide variety of functions and services. 
Some of the functions and services, provided by default, may not be necessary to support essential organizational operations (e.g., key missions, functions). 
The rsh-server service provides an unencrypted remote access service that does not provide for the confidentiality and integrity of user passwords or the 
remote session and has very weak authentication. If a privileged user were to log on using this service, the privileged user password could be compromised.
inV71967

rsh="$(rpm -q rsh-server)"
if [[ $rsh == *"not installed"* ]];
then
    echo "Not installed"
else
    while true; do
    echo "Remove the rsh-server package from the system."
    read -p "Do you want to uninstall it now? y/n" yn
    case $yn in
        [Yy]* ) "$(yum remove rsh-server)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV71967
--------------------Out V-71967 Script-------------------
outV71967
