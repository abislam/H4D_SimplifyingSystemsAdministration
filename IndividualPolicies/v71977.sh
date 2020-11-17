###############################################V-71977#############################################

cat << inV71977
--------------------In V-71977 Script-------------------
Changes to any software components can have significant effects on the overall security of the operating system. 
This requirement ensures the software has not been tampered with and that it has been provided by a trusted vendor. 
Accordingly, patches, service packs, device drivers, or operating system components must be signed with a certificate 
recognized and approved by the organization. Verifying the authenticity of the software prior to installation 
validates the integrity of the patch or upgrade received from a vendor. This verifies the software has not been tampered 
with and that it has been provided by a trusted vendor. Self-signed certificates are disallowed by this requirement. 
The operating system should not have to verify the software again. This requirement does not mandate DoD certificates for this purpose; 
however, the certificate used to verify the software must be from an approved CA.
inV71977

gpgcheck="$( grep gpgcheck /etc/yum.conf)"
if [[ $gpgcheck == "gpgcheck=1" ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Configure the operating system to verify the signature of packages from a repository prior to install by setting the following option in the '/etc/yum.conf' file:

gpgcheck=1 "
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71977
--------------------Out V-71977 Script-------------------
outV71977
