###############################################V-72313 untested#############################################
cat << inV72313
--------------------In V-72313 Script-------------------
Whether active or not, default Simple Network Management Protocol (SNMP) community strings must be changed to maintain security.
 If the service is running with the default authenticators, anyone can gather data about the system and the network
 and use the information to potentially compromise the integrity of the system or network(s).
 It is highly recommended that SNMP version 3 user authentication and message encryption be used in place of the version 2 community strings.
inV72313

file=/etc/snmp/snmpd.conf
if test -f "$file";
then
while true; do
    if grep -q public /etc/snmp/snmpd.conf || if grep -q private /etc/snmp/snmpd.conf
    then
        echo "Please modify any lines that contain a community string value of 'public' or 'private' to another string value in '/etc/snmp/snmpd.conf'"
        read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
        case $yn in
             [Yy]* ) break;;
              [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
        done
    else
        echo "The systems using SNMP are not using default community strings"   
    fi

else
while true; do
        echo "The file does not exist, this is Not Applicable"
        read -p "Do you want to make a change first? y/n" yn
        case $yn in
             [Yy]* )
             		###################updates############################################# 
   					echo "Please make your changes now in a different window"
   					echo "Are you done?"
   					case $yn in
   						[Yy]*) break;;
						[Nn]*)
							echo "Waiting..." 
							continue;;
					###################updates############################################# 
						*) echo "Please answer yes or no.";;
   					exit;;
              [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi   

cat << outV72313
--------------------Out V-72313 Script-------------------
outV72313
