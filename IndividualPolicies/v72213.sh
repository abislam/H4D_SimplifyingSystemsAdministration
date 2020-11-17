###############################################V-72213#############################################

cat << inV72213
--------------------In V-72213 Script-------------------
Virus scanning software can be used to protect a system from penetration from computer viruses and to limit their spread through intermediate systems. 
The virus scanning software should be configured to perform scans dynamically on accessed files. 
If this capability is not available, the system must be configured to scan, at a minimum, all altered files on the system on a daily basis. 
If the system processes inbound SMTP mail, the virus scanner must be configured to scan all received mail.
inV72213

zenity --info --text="If there is no anti-virus solution installed on the system, Install an antivirus solution on the system." --title="Attention!" &
notify-send "If there is no anti-virus solution installed on the system, Install an antivirus solution on the system."



cat << outV72213
--------------------Out V-72213 Script-------------------
outV72213
