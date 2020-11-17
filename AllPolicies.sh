#!/bin/bash

rm ~/Desktop/stig_log.txt
touch ~/Desktop/stig_log.txt
echo "file created"


###############################################V-71937#############################################

cat << inV71937
--------------------In V-71937 Script-------------------
If an account has an empty password, anyone could log on and run commands with the privileges of that account. 
Accounts with empty passwords should never be used in operational environments.
inV71937

nullok="$(grep nullok /etc/pam.d/system-auth /etc/pam.d/password-auth)"
if [[ $nullok == "" ]];
then
	echo "Everything looks good in policy v71937" >> ~/Desktop/stig_log.txt 
	break
else
    while true; do
    echo "Remove any instances of the 'nullok' option in '/etc/pam.d/system-auth' and '/etc/pam.d/password-auth' to prevent logons with empty passwords."
    read -p "Make changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) $(echo "changes made in policy v71937" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v71937" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi


cat << outV71937
--------------------Out V-71937 Script-------------------
outV71937



###############################################V-71939#############################################
cat << inV71939
--------------------In V-71939 Script-------------------
Configuring this setting for the SSH daemon provides additional assurance that remote logon via SSH will require a password, even in the event of misconfiguration elsewhere.
inV71939

ssh="$(grep -i PermitEmptyPasswords /etc/ssh/sshd_config)"
if [[ $ssh == *"PermitEmptyPasswords no"* ]];
then
    	echo "Everything looks good in policy v71939" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Add or correct the following line in '/etc/ssh/sshd_config':

PermitEmptyPasswords no"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) $(echo "changes made in policy v71939" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v71939" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   


cat << outV71939
--------------------Out V-71939 Script-------------------
outV71939


###############################################V-71953#####################################################   

cat << inV71953
--------------------In V-71953 Script-------------------
Failure to restrict system access to authenticated users negatively impacts operating system security.
inV71953

automaticlogin="$(grep -i automaticloginenable /etc/gdm/custom.conf)"
if [[ $automaticlogin == "AutomaticLoginEnable=false" ]];
then
    echo "AutomaticLoginEnable is set to false"
else
    while true; do
    echo "Add or edit the line for the 'AutomaticLoginEnable' parameter in the [daemon] section of the '/etc/gdm/custom.conf' file to 'false'"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
   [Yy]* ) $(echo "changes made in policy v71953" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v71953" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV71953
--------------------Out V-71953 Script-------------------
outV71953


###############################################V-71955#############################################
cat << inV71955
--------------------In V-71955 Script-------------------
Failure to restrict system access to authenticated users negatively impacts operating system security.
inV71955

timedlogin="$(grep -i timedloginenable /etc/gdm/custom.conf)"
if [[ $timedlogin == "TimedLoginEnable=false" ]];
then
    echo "TimedLoginEnable is set to false"
else
    while true; do
    echo "Add or edit the line for the 'TimedLoginEnable' parameter in the [daemon] section of the '/etc/gdm/custom.conf' file to 'false'"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
        [Yy]* ) $(echo "changes made in policy v71955" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v71955" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV71955
--------------------Out V-71955 Script-------------------
outV71955


###############################################V-71961#############################################

cat << inV71961
--------------------In V-71961 Script-------------------
If the system does not require valid root authentication before it boots into single-user or maintenance mode, 
anyone who invokes single-user or maintenance mode is granted privileged access to all files on the system. 
GRUB 2 is the default boot loader for RHEL 7 and is designed to require a password to boot into single-user mode or make modifications to the boot menu.
inV71961

ypserv="$(grep -i password_pbkdf2 /boot/grub2/grub.cfg)"
if [[ $ypserv == *"password_pbkdf2"* ]] && [[ "$ypserv" == *"root"* ]];
then
    	echo "Everything looks good in policy v71961" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Add or edit the line for the 'AutomaticLoginEnable' parameter in the [daemon] section of the '/etc/gdm/custom.conf' file to 'false'"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
       [Yy]* ) $(echo "changes made in policy v71961" >> ~/Desktop/stig_log.txt); break;;
       [Nn]* ) $(echo "Skipped v71961" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71961
--------------------Out V-71961 Script-------------------
outV71961


###############################################V-71967#############################################

cat << inV71967
--------------------In V-71967 Script-------------------
It is detrimental for operating systems to provide, or install by default, functionality exceeding requirements or mission objectives. 
These unnecessary capabilities or services are often overlooked and therefore may remain unsecured. 
They increase the risk to the platform by providing additional attack vectors. 
Operating systems are capable of providing a wide variety of functions and services. 
Some of the functions and services, provided by default, may not be necessary to support essential organizational operations (e.g., key missions, functions). 
The rsh-server service provides an unencrypted remote access service that does not provide for the confidentiality and integrity of user passwords or the 
remote session and has very weak authentication. If a privileged user were to log on using this service, the privileged user password could be compromised.
inV71967

rsh="$(rpm -q rsh-server)"
if [[ $rsh == *"not installed"* ]];
then
    echo "Not installed"
else
    while true; do
    echo "Remove the rsh-server package from the system."
    read -p "Do you want to uninstall it now? y/n" yn
    case $yn in
        [Yy]* ) "$(yum remove rsh-server)"; $(echo "changes made in policy v71967" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v71967" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV71967
--------------------Out V-71967 Script-------------------
outV71967



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
        [Yy]* ) "$(yum remove ypserve)"; $(echo "changes made in policy v71969" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v71969" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71969   
--------------------Out V-71969 Script-------------------
outV71969



###############################################V-71977#############################################

cat << inV71977
--------------------In V-71977 Script-------------------
Changes to any software components can have significant effects on the overall security of the operating system. 
This requirement ensures the software has not been tampered with and that it has been provided by a trusted vendor. 
Accordingly, patches, service packs, device drivers, or operating system components must be signed with a certificate 
recognized and approved by the organization. Verifying the authenticity of the software prior to installation 
validates the integrity of the patch or upgrade received from a vendor. This verifies the software has not been tampered 
with and that it has been provided by a trusted vendor. Self-signed certificates are disallowed by this requirement. 
The operating system should not have to verify the software again. This requirement does not mandate DoD certificates for this purpose; 
however, the certificate used to verify the software must be from an approved CA.
inV71977

gpgcheck="$( grep gpgcheck /etc/yum.conf)"
if [[ $gpgcheck == "gpgcheck=1" ]];
then
    	echo "Everything looks good in policy v71977" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Configure the operating system to verify the signature of packages from a repository prior to install by setting the following option in the '/etc/yum.conf' file:

gpgcheck=1 "
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
	[Yy]* ) $(echo "changes made in policy v71977" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v71977" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71977
--------------------Out V-71977 Script-------------------
outV71977




###############################################V-71979#############################################
cat << inV71979
--------------------In V-71979 Script-------------------
Changes to any software components can have significant effects on the overall security of the operating system. 
This requirement ensures the software has not been tampered with and that it has been provided by a trusted vendor. 
Accordingly, patches, service packs, device drivers, or operating system components must be signed with a certificate 
recognized and approved by the organization. Verifying the authenticity of the software prior to installation validates 
the integrity of the patch or upgrade received from a vendor. This verifies the software has not been tampered with and 
that it has been provided by a trusted vendor. Self-signed certificates are disallowed by this requirement. 
The operating system should not have to verify the software again. 
This requirement does not mandate DoD certificates for this purpose; however, the certificate used to verify the 
software must be from an approved CA.
inV71979

gpgcheck="$(grep localpkg_gpgcheck /etc/yum.conf)"
if [[ $gpgcheck == "localpkg_gpgcheck=1" ]]; ###changed from gpacheck to gpgcheck
then
    echo "the signature of local packages looks good"
else
    while true; do
    echo "ask the System Administrator how the signatures of local packages and other operating system components are verified"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
	[Yy]* ) $(echo "changes made in policy v71979" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v71979" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done
   
fi

cat << outV71979
--------------------Out V-71979 Script-------------------
outV71979




###############################################V-71989#############################################

cat << inV71989
--------------------In V-71989 Script-------------------
Without verification of the security functions, security functions may not operate correctly and the failure may go unnoticed. 
Security function is defined as the hardware, software, and/or firmware of the information system responsible for enforcing the 
system security policy and supporting the isolation of code and data on which the protection is based. 
Security functionality includes, but is not limited to, establishing system accounts, configuring access authorizations (i.e., permissions, privileges), 
setting events to be audited, and setting intrusion detection parameters. 
This requirement applies to operating systems performing security function verification/testing and/or systems and environments that require this functionality.
inV71989

selinux="$(getenforce)"
if [[ $selinux == "Enforcing" ]];
then
    	echo "Everything looks good in policy v71989" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Set the 'SELinux' status and the 'Enforcing' mode by modifying the '/etc/selinux/config' file to have the following line:

SELINUX=enforcing "
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
	[Yy]* ) $(echo "changes made in policy v71989" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v71989" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71989
--------------------Out V-71989 Script-------------------
outV71989




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
    	echo "Everything looks good in policy v71993" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Disable the Ctrl-Alt-Delete sequence"
    read -p "Do you want to uninstall it now? y/n" yn
    case $yn in
        [Yy]* ) "$(systemctl mask ctrl-alt-del.target)"; $(echo "changes made in policy v71993" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v71993" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71993
--------------------Out V-71993 Script-------------------
outV71993




###############################################V-71997#############################################

cat << inV71997
--------------------In V-71997 Script-------------------
An operating system release is considered "supported" if the vendor continues to provide security patches for the product. 
With an unsupported release, it will not be possible to resolve security issues discovered in the system software.
inV71997

ver="$(cat /etc/redhat-release)"
if [[ $ver == *"7.1"* ]] || [[ $ver == *"7.2"* ]] || [[ $ver == *"7.3"* ]] || [[ $ver == *"7.4"* ]] || [[ $ver == *"7.5"* ]] || [[ $ver == *"7.6"* ]] || [[ $ver == *"7.7"* ]] ;
then
    	echo "Everything looks good in policy v71997" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Upgrade to a supported version of the operating system."
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
	[Yy]* ) $(echo "changes made in policy v71997" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v71997" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV71997
--------------------Out V-71997 Script-------------------
outV71997




###############################################V-72005#############################################
cat << inV72005
--------------------In V-72005 Script-------------------
If an account other than root also has a User Identifier (UID) of "0", it has root authority, 
giving that account unrestricted access to the entire operating system. 
Multiple accounts with a UID of "0" afford an opportunity for potential intruders to guess a password for a privileged account.
inV72005


rootcheck=$(awk -F: '$3 == 0 {print $1}' /etc/passwd)
if [[ $rootcheck == "root" ]];
then
    echo "root is the only account with UID of 0"
else
while true; do
    echo "Change the UID of any account on the system, other than root, that has a UID of '0'"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
	[Yy]* ) $(echo "changes made in policy v72005" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v72005" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done       
fi

cat << outV72005
--------------------Out V-72005 Script-------------------
outV72005




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
    	echo "Everything looks good in policy v72077" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Please remove the telnet-server"
    read -p "Do you want to make a change now? y/n" yn
    case $yn in
        [Yy]* ) "$(yum remove telnet-server)"; $(echo "changes made in policy v72077" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v72077" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi


cat << outV72077
--------------------Out V-72077 Script-------------------
outV72077



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
    	echo "Everything looks good in policy v72079" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Please enable the audited service"
    read -p "Do you want to make a change now? y/n" yn
    case $yn in
        [Yy]* ) "$(systemctl start auditd.service)"; $(echo "changes made in policy v72079" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v72079" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72079
--------------------Out V-72079 Script-------------------
outV72079


###############################################V-72213#############################################

cat << inV72213
--------------------In V-72213 Script-------------------
Virus scanning software can be used to protect a system from penetration from computer viruses and to limit their spread through intermediate systems. 
The virus scanning software should be configured to perform scans dynamically on accessed files. 
If this capability is not available, the system must be configured to scan, at a minimum, all altered files on the system on a daily basis. 
If the system processes inbound SMTP mail, the virus scanner must be configured to scan all received mail.
inV72213

echo "changes made in policy v72213" >> ~/Desktop/stig_log.txt

zenity --info --text="If there is no anti-virus solution installed on the system, Install an antivirus solution on the system." --title="Attention!" &
notify-send "If there is no anti-virus solution installed on the system, Install an antivirus solution on the system."



cat << outV72213
--------------------Out V-72213 Script-------------------
outV72213


###############################################V-72251#############################################
cat << inV72251
--------------------In V-72251 Script-------------------
SSHv1 is an insecure implementation of the SSH protocol and has many well-known vulnerability exploits.
Exploits of the SSH daemon could provide immediate root access to the system. 
Satisfies: SRG-OS-000074-GPOS-00042, SRG-OS-000480-GPOS-00227
inV72251

 sshcheck="$(grep -i protocol /etc/ssh/sshd_config)"
if [[ $sshcheck == "Protocol 2" ]];
then
    echo "SSH is configured well"
else
    while true; do
    echo "It has to be 'Protocol 2'"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
	[Yy]* ) $(echo "changes made in policy v72251" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v72251" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72251
--------------------Out V-72251 Script-------------------
outV72251


###############################################V-72277#############################################

cat << inV72277
--------------------In V-72277 Script-------------------
The .shosts files are used to configure host-based authentication for individual users or the system via SSH. 
Host-based authentication is not sufficient for preventing unauthorized access to the system, as it does not 
require interactive identification and authentication of a connection request, or for the use of two-factor authentication.
inV72277

shots="$(find / -name '*.shosts')"
echo $shots
if [[ $shots == "" ]];
then
    	echo "Everything looks good in policy v72277" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Remove any found '.shosts' files from the system"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
	[Yy]* ) $(echo "changes made in policy v72277" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v72277" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72277
--------------------Out V-72277 Script-------------------
outV72277



###############################################V-72279#############################################

cat << inV72279
--------------------In V-72279 Script-------------------
The shosts.equiv files are used to configure host-based authentication for the system via SSH. 
Host-based authentication is not sufficient for preventing unauthorized access to the system, 
as it does not require interactive identification and authentication of a connection request, or for the use of two-factor authentication.
inV72279

sequiv="$(find / -name shosts.equiv)"
echo $sequiv
if [[ $sequiv == "" ]];
then
    	echo "Everything looks good in policy v72279" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Remove any found 'shosts.equiv' files from the system"
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
	[Yy]* ) $(echo "changes made in policy v72279" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v72279" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72279
--------------------Out V-72279 Script-------------------
outV72279



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
        [Yy]* ) "$(yum remove vsftpd)"; $(echo "changes made in policy v72299" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v72299" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV72299
--------------------Out V-72299 Script-------------------
outV72299


###############################################V-72301#############################################
cat << inV72301
--------------------In V-72301 Script-------------------
If TFTP is required for operational support (such as the transmission of router configurations)
its use must be documented with the Information System Security Officer (ISSO), 
restricted to only authorized personnel, and have access control rules established.
inV72301

tftp="$(rpm -q tftp-server)"
if [[ $tftp == *"not installed"* ]];
then
    echo "Not installed"
else
    while true; do
    echo "Remove the TFTP package from the system."
    read -p "Do you want to uninstall it now? y/n" yn
    case $yn in
        [Yy]* ) "$(yum remove tftp-server)"; $(echo "changes made in policy v72301" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v72301" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi   

cat << outV72301
--------------------Out V-72301 Script-------------------
outV72301


###############################################V-72303 #############################################

cat << inV72303
--------------------In V-72303 Script-------------------
Open X displays allow an attacker to capture keystrokes and execute commands remotely.
inV72303

remotex="$(grep -i x11forwarding /etc/ssh/sshd_config | grep -v '^#')"
if [[ $remotex == *"yes"* ]];
then
    	echo "Everything looks good in policy v72303" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Edit the '/etc/ssh/sshd_config' file to uncomment or add the line for the 'X11Forwarding' keyword and set its value to 'yes' "
    read -p "Make your changes now and type y to continue or n to skip policy. y/n" yn
    case $yn in
	[Yy]* ) $(echo "changes made in policy v72303" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v72303" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi

cat << outV72303
--------------------Out V-72303 Script-------------------
outV72303



###############################################V-81007 untested#############################################
cat << inV81007
--------------------In V-81007 Script-------------------
If the system does not require valid root authentication before it boots into single-user or maintenance mode, anyone who invokes single-user or 
maintenance mode is granted privileged access to all files on the system.
GRUB 2 is the default boot loader for RHEL 7 and is designed to require a password to boot into single-user mode or make modifications to the boot menu.
inV81007

#check if bios exists
#if file exists, UEFI, else BIOS exists

cat /proc/version
echo "Is the red hat version below 7.2?"
case $yn in
	[Yy]* ) $(echo "changes made in policy v81007" >> ~/Desktop/stig_log.txt); break;;
       	[Nn]* ) $(echo "Skipped v81007" >> ~/Desktop/stig_log.txt); break;;
	* ) echo "Please answer yes or no.";;
esac

FILE=/sys/firmware/efi
if test -f "$FILE"; then
	echo "UEFI used"
	grep -iw grub2_password /boot/efi/EFI/redhat/user.cfg
	GRUB2_PASSWORD=grub.pbkdf2.sha512.[password_hash]
	grep -iw "superusers" /boot/efi/EFI/redhat/grub.cfg
	set superusers="root"
	export superusers
else
	echo "BIOS used"

fi

cat << outV81007
--------------------Out V-81007 Script-------------------
outV81007



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
    	echo "Everything looks good in policy v94843" >> ~/Desktop/stig_log.txt
	break
else
    while true; do
    echo "Configure the system to disable the Ctrl-Alt-Delete sequence for the graphical user interface"
    read -p "Do you want to make the change now? y/n" yn
    case $yn in
        [Yy]* ) "$(touch /etc/dconf/db/local.d/00-disable-CAD)" && "$(printf $'[org/gnome/settings-daemon/plugins/media-keys]\nlogout=\'\'' >> /etc/dconf/db/local.d/00-disable-CAD)"; $(echo "changes made in policy v94843" >> ~/Desktop/stig_log.txt); break;;
        [Nn]* ) $(echo "Skipped v94843" >> ~/Desktop/stig_log.txt); break;;
        * ) echo "Please answer yes or no.";;
    esac
done   
fi  

cat << outV94843
--------------------Out V-94843 Script-------------------
outV94843




























































































































