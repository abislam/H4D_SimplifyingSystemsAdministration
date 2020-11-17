###############################################V-71953#####################################################   

cat << inV71953
--------------------In V-71953 Script-------------------
Failure to restrict system access to authenticated users negatively impacts operating system security.
inV71953

automaticlogin="$(grep -i automaticloginenable /etc/gdm/custom.conf)"
if [[ $automaticlogin == "AutomaticLoginEnable=false" ]];
then
    echo "AutomaticLoginEnable is set to false"
else
    while true; do
    echo "Add or edit the line for the 'AutomaticLoginEnable' parameter in the [daemon] section of the '/etc/gdm/custom.conf' file to 'false'"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV71953
--------------------Out V-71953 Script-------------------
outV71953
