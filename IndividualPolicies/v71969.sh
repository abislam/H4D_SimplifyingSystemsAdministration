###############################################V-71969#############################################
cat << inV71969
--------------------In V-71969 Script-------------------
Removing the "ypserv" package decreases the risk of the accidental (or intentional) activation of NIS or NIS+ services.
inV71969

ypserv="$(rpm -q ypserv)"
if [[ $ypserv == *"not installed"* ]];
then
    echo "Not installed"
else
    while true; do
    echo "Removing the 'ypserv' package decreases the risk of the accidental (or intentional) activation of NIS or NIS+ services."
    read -p "Do you want to uninstall it now? y/n" yn
    case $yn in
        [Yy]* ) "$(yum remove ypserve)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71969   
--------------------Out V-71969 Script-------------------
outV71969
