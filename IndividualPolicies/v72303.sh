###############################################V-72303 #############################################

cat << inV72303
--------------------In V-72303 Script-------------------
Open X displays allow an attacker to capture keystrokes and execute commands remotely.
inV72303

remotex="$(grep -i x11forwarding /etc/ssh/sshd_config | grep -v '^#')"
if [[ $remotex == *"yes"* ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Edit the '/etc/ssh/sshd_config' file to uncomment or add the line for the 'X11Forwarding' keyword and set its value to 'yes' "
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72303
--------------------Out V-72303 Script-------------------
outV72303
