###############################################V-94843 untested#############################################
cat << inV94843
--------------------In V-94843 Script-------------------
A locally logged-on user who presses Ctrl-Alt-Delete, when at the console, can reboot the system. 
If accidentally pressed, as could happen in the case of a mixed OS environment, this can create 
the risk of short-term loss of availability of systems due to unintentional reboot. 
In the graphical environment, risk of unintentional reboot from the Ctrl-Alt-Delete sequence 
is reduced because the user will be prompted before any action is taken.
inV94843

logout="$(grep logout /etc/dconf/db/local.d/*)"
if [[ $logout == *"logout=''"* ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Configure the system to disable the Ctrl-Alt-Delete sequence for the graphical user interface"
    read -p "Do you want to make the change now? y/n" yn
    case $yn in
        [Yy]* ) "$(touch /etc/dconf/db/local.d/00-disable-CAD)" && "$(printf $'[org/gnome/settings-daemon/plugins/media-keys]\nlogout=\'\'' >> /etc/dconf/db/local.d/00-disable-CAD)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi  

cat << outV94843
--------------------Out V-94843 Script-------------------
outV94843
