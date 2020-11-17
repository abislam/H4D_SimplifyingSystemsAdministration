###############################################V-71989#############################################

cat << inV71989
--------------------In V-71989 Script-------------------
Without verification of the security functions, security functions may not operate correctly and the failure may go unnoticed. 
Security function is defined as the hardware, software, and/or firmware of the information system responsible for enforcing the 
system security policy and supporting the isolation of code and data on which the protection is based. 
Security functionality includes, but is not limited to, establishing system accounts, configuring access authorizations (i.e., permissions, privileges), 
setting events to be audited, and setting intrusion detection parameters. 
This requirement applies to operating systems performing security function verification/testing and/or systems and environments that require this functionality.
inV71989

selinux="$(getenforce)"
if [[ $selinux == "Enforcing" ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Set the 'SELinux' status and the 'Enforcing' mode by modifying the '/etc/selinux/config' file to have the following line:

SELINUX=enforcing "
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71989
--------------------Out V-71989 Script-------------------
outV71989
