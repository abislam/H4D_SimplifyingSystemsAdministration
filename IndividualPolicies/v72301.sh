###############################################V-72301#############################################
cat << inV72301
--------------------In V-72301 Script-------------------
If TFTP is required for operational support (such as the transmission of router configurations)
its use must be documented with the Information System Security Officer (ISSO), 
restricted to only authorized personnel, and have access control rules established.
inV72301

tftp="$(rpm -q tftp-server)"
if [[ $tftp == *"not installed"* ]];
then
    echo "Not installed"
else
    while true; do
    echo "Remove the TFTP package from the system."
    read -p "Do you want to uninstall it now? y/n" yn
    case $yn in
        [Yy]* ) "$(yum remove tftp-server)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV72301
--------------------Out V-72301 Script-------------------
outV72301
