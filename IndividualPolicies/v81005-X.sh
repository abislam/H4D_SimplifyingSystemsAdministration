###############################################V-81005 untested#############################################
cat << inV81005
--------------------In V-81005 Script-------------------
If the system does not require valid root authentication before it boots into single-user or maintenance mode, anyone who invokes single-user or 
maintenance mode is granted privileged access to all files on the system. 
GRUB 2 is the default boot loader for RHEL 7 and is designed to require a password to boot into single-user mode or make modifications to the boot menu.
inV81005


cat << outV81005
--------------------Out V-81005 Script-------------------
outV81005
