###############################################V-71855 untested#############################################

cat << inV71855
--------------------In V-71855 Script-------------------
Without cryptographic integrity protections, system command and files can be altered by unauthorized users without detection. 
Cryptographic mechanisms used for protecting the integrity of information include, for example, signed hash functions using 
asymmetric cryptography enabling distribution of the public key to verify the hash information while maintaining the confidentiality of the key used to generate the hash.
inV71855

#rpm="$(rpm -Va --noconfig | grep '^..5')"
#if [[ $rpm == *"unknown option"* ]];
#then
#    echo "Everything looks good"
#else
#    while true; do
#    echo "Please reinstall the package"
#    read -p "Do you want to make the change now? y/n" yn
#    case $yn in
 #       [Yy]* ) "$(sudo yum reinstall)" &&exit;;
 #       [Nn]* ) break;;
 #       * ) echo "Please answer yes or no.";;
#    esac
#done   
#fi   

cat << outV71855
--------------------Out V-71855 Script-------------------
outV71855
