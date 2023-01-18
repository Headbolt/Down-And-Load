#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	Down-And-Load.sh
#	https://github.com/Headbolt/Down-And-Load
#
#   This Script is designed for use in JAMF and was designed to Download an App installer and install it
#
#	The Following Variables should be defined
#	Variable 4 - Named "Download URL for Client Connector - eg. https://api-cloudstation-us-east-2.prod.hydra.sophos.com/api/download/SophosInstall.zip"
#	Variable 5 - Named "Destination - eg. /Private/var/download"
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 18/01/2023
#
#	18/01/2023 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
#   DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################################################
#
DownloadURL=$4 # Grab the Download URL from JAMF variable #4 eg. eg. https://domain.com/logo.png
Destination=$5 # Grab the Destination from JAMF variable #5 eg. /Private/var/logo.tmp
#
ScriptName="Global | Download File"
ExitCode=0
#
###############################################################################################################################################
#
#   Checking and Setting Variables Complete
#
###############################################################################################################################################
# 
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
# Defining Functions
#
###############################################################################################################################################
#
# Download Function
#
Download(){
#
if [ -d "$Destination" ]
	then
		Destination=$Destination
	else
		/bin/echo 'Creating Folder "'$Destination'"'
		/bin/echo # Outputting a Blank Line for Reporting Purposes
		mkdir $Destination
fi
#
cd $Destination
#
/bin/echo 'Downloading the file'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo 'Running command "curl -L -O '$DownloadURL'"'
/bin/echo # Outputting a Blank Line for Reporting Purposes
curl -L -O "$DownloadURL"
#
}
#
###############################################################################################################################################
#
# Section End Function
#
SectionEnd(){
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
}
#
###############################################################################################################################################
#
# Script End Function
#
ScriptEnd(){
#
/bin/echo Ending Script '"'$ScriptName'"'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
exit $ExitCode
#
}
#
###############################################################################################################################################
#
# End Of Function Definition
#
###############################################################################################################################################
# 
# Begin Processing
#
###############################################################################################################################################
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
SectionEnd
#
Download
SectionEnd
ScriptEnd
