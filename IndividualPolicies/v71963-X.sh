###############################################V-71963 untested#############################################

cat << inV71963
--------------------In V-71963 Script-------------------
If the system does not require valid root authentication before it boots into single-user or maintenance mode, 
anyone who invokes single-user or maintenance mode is granted privileged access to all files on the system. 
GRUB 2 is the default boot loader for RHEL 7 and is designed to require a password to boot into single-user mode or make modifications to the boot menu.
inV71963



cat << outV71963
--------------------Out V-71963 Script-------------------
outV71963
