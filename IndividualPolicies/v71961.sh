###############################################V-71961#############################################

cat << inV71961
--------------------In V-71961 Script-------------------
If the system does not require valid root authentication before it boots into single-user or maintenance mode, 
anyone who invokes single-user or maintenance mode is granted privileged access to all files on the system. 
GRUB 2 is the default boot loader for RHEL 7 and is designed to require a password to boot into single-user mode or make modifications to the boot menu.
inV71961

ypserv="$(grep -i password_pbkdf2 /boot/grub2/grub.cfg)"
if [[ $ypserv == *"password_pbkdf2"* ]] && [[ "$ypserv" == *"root"* ]];
then
    echo "Everything looks good"
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

cat << outV71961
--------------------Out V-71961 Script-------------------
outV71961
