###############################################V-71997#############################################

cat << inV71997
--------------------In V-71997 Script-------------------
An operating system release is considered "supported" if the vendor continues to provide security patches for the product. 
With an unsupported release, it will not be possible to resolve security issues discovered in the system software.
inV71997

ver="$(cat /etc/redhat-release)"
if [[ $ver == *"7.1"* ]] || [[ $ver == *"7.2"* ]] || [[ $ver == *"7.3"* ]] || [[ $ver == *"7.4"* ]] || [[ $ver == *"7.5"* ]] || [[ $ver == *"7.6"* ]] || [[ $ver == *"7.7"* ]] ;
then
    echo "Everything looks good"
else
    while true; do
    echo "Upgrade to a supported version of the operating system."
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71997
--------------------Out V-71997 Script-------------------
outV71997
