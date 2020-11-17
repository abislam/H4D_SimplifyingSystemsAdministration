###############################################V-72299#############################################
cat << inV72299
--------------------In V-72299 Script-------------------
The FTP service provides an unencrypted remote access that does not provide for the confidentiality and 
integrity of user passwords or the remote session. If a privileged user were to log on using this service, 
the privileged user password could be compromised. 
SSH or other encrypted file transfer methods must be used in place of this service.
inV72299

rsh="$(rpm -q vsftpd)"
if [[ $rsh == *"not installed"* ]];
then
    echo "Not installed"
else
    while true; do
    echo "Remove the 'vsftpd' package from the system."
    read -p "Do you want to uninstall it now? y/n" yn
    case $yn in
        [Yy]* ) "$(yum remove vsftpd)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV72299
--------------------Out V-72299 Script-------------------
outV72299
