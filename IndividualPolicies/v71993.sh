###############################################V-71993#############################################

cat << inV71993
--------------------In V-71993 Script-------------------
A locally logged-on user who presses Ctrl-Alt-Delete, when at the console, can reboot the system. 
If accidentally pressed, as could happen in the case of a mixed OS environment, this can create the risk of short-term loss of availability of systems due to unintentional reboot. 
In the GNOME graphical environment, risk of unintentional reboot from the Ctrl-Alt-Delete sequence is reduced because the user will be prompted before any action is taken.
inV71993

target="$(systemctl status ctrl-alt-del.target)"
if [[ $target == *"masked"* ]] && [[ $target == *"Active: inactive"* ]] ;
then
    echo "Everything looks good"
else
    while true; do
    echo "Disable the Ctrl-Alt-Delete sequence"
    read -p "Do you want to uninstall it now? y/n" yn
    case $yn in
        [Yy]* ) "$(systemctl mask ctrl-alt-del.target)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71993
--------------------Out V-71993 Script-------------------
outV71993
