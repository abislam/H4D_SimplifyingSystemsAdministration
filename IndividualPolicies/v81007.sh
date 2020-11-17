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
	[Yy]* ) break;;
	[Nn]* )	break;;
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
