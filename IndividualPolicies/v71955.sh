###############################################V-71955#############################################
cat << inV71955
--------------------In V-71955 Script-------------------
Failure to restrict system access to authenticated users negatively impacts operating system security.
inV71955

timedlogin="$(grep -i timedloginenable /etc/gdm/custom.conf)"
if [[ $timedlogin == "TimedLoginEnable=false" ]];
then
    echo "TimedLoginEnable is set to false"
else
    while true; do
    echo "Add or edit the line for the 'TimedLoginEnable' parameter in the [daemon] section of the '/etc/gdm/custom.conf' file to 'false'"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV71955
--------------------Out V-71955 Script-------------------
outV71955
