###############################################V-72067 untested#############################################
cat << inV72067
--------------------In V-72067 Script-------------------
Use of weak or untested encryption algorithms undermines the purposes of using encryption to protect data. 
The operating system must implement cryptographic modules adhering to the higher standards approved by the federal government since this provides assurance they have been tested and validated. 
Satisfies: SRG-OS-000033-GPOS-00014, SRG-OS-000185-GPOS-00079, SRG-OS-000396-GPOS-00176, SRG-OS-000405-GPOS-00184, SRG-OS-000478-GPOS-00223

inV72067

yum install dracut-fips
dracut -f

echo "Modify the kernel command line of the current kernel in the [grub.cfg] file by adding [fips=1] to the [GRUB_CMDLINE_LINUX] key in the [/etc/default/grub file]"

##check if bios or uefi
FILE=/sys/firmware/efi
if test -f "$FILE"; then
	echo "UEFI used"
	grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg
else
	echo "BIOS used"
	grub2-mkconfig -o /boot/grub2/grub.cfg
done
fi

################not complete read second half of stig


cat << outV72067
--------------------Out V-72067 Script-------------------
outV72067
