###############################################V-72079#############################################

cat << inV72079
--------------------In V-72079 Script-------------------
Without establishing what type of events occurred, it would be difficult to establish, correlate, and 
investigate the events leading up to an outage or attack. Audit record content that may be necessary to satisfy 
this requirement includes, for example, time stamps, source and destination addresses, user/process identifiers, 
event descriptions, success/fail indications, filenames involved, and access control or flow control rules invoked. 
Associating event types with detected events in the operating system audit logs provides a means of investigating an attack; 
recognizing resource utilization or capacity thresholds; or identifying an improperly configured operating system. 
Satisfies: SRG-OS-000038-GPOS-00016, SRG-OS-000039-GPOS-00017, SRG-OS-000042-GPOS-00021, SRG-OS-000254-GPOS-00095, SRG-OS-000255-GPOS-00096
inV72079

auditd="$(systemctl is-active auditd.service)"
if [[ $auditd == "active" ]];
then
    echo "Everything looks good"
else
    while true; do
    echo "Please enable the audited service"
    read -p "Do you want to make a change now? y/n" yn
    case $yn in
        [Yy]* ) "$(systemctl start auditd.service)"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72079
--------------------Out V-72079 Script-------------------
outV72079
