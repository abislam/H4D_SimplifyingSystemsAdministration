# H4D_SimplifyingSystemsAdministration
This repository includes automated STIG policies for Red Hat 7 Enterprise through the use of BASH scripting


## Files included:
- **AllPolicies.sh** : This script file contains all the working policies ready to automatically run one at a time.
- **Successful_UnsuccessfulPolicies.txt** : This file text file contains a list of work in progress policies that need to be automated.
- **/IndividualPolicies** : This folder contains all policies in individual script files to test individually.
- **BashTutorialCheatSheet** : This folder contains a script file with some basic BASH scripting commands to get you started.


## How to run script##
- Download **AllPolicies.sh**
- In the terminal, navigate to the location of **AllPolicies.sh** 
- Type **chmod u+x AllPolicies.sh** to create an executable file for it
- Type **./AllPolicies.sh** to run the executable file

## Basic Script Format
- Script removes file from desktop called **stig_log.txt**
- Script creates a new text file called **stig_log.txt** to save logs about progress made in this session.
- Script prints "In policy number #######"
- Description of policy and what it does
- Linux command executes if policy requires it
- Script asks user to make changes to specific files if policy requires it
- Script asks user if they want to skip the policy and move on to the next one
- Script saves the user decision in **stig_log.txt**
- Script prints "Out policy number #######"
- Script moves on to next policy
