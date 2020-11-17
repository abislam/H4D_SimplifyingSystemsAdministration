###############################################V-72077#############################################

cat << inV72077
--------------------In V-72077 Script-------------------
It is detrimental for operating systems to provide, or install by default, functionality exceeding requirements or mission objectives. 
These unnecessary capabilities or services are often overlooked and therefore may remain unsecured. 
They increase the risk to the platform by providing additional attack vectors. 
Operating systems are capable of providing a wide variety of functions and services. 
Some of the functions and services, provided by default, may not be necessary to support essential organizational 
operations (e.g., key missions, functions). Examples of non-essential capabilities include, but are not limited to, 
games, software packages, tools, and demonstration software not related to requirements or providing a wide array of functionality 
not required for every mission, but which cannot be disabled.
inV72077

telnet="$(rpm -q telnet-server)"
echo $telnet
if [[ $telnet == *"not installed"* ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Please remove the telnet-server"
    read -p "Do you want to make a change now? y/n" yn
    case $yn in
        [Yy]* ) "$(yum remove telnet-server)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi


cat << outV72077
--------------------Out V-72077 Script-------------------
outV72077
