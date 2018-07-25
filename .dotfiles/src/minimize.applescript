#!/usr/bin/osascript

on appExists(appName)
	tell application "Finder"
		if exists file (appName) of (path to applications folder from system domain) then return true
		if exists file (appName) of (path to applications folder from user domain) then return true
		if exists file (appName) of (path to applications folder from local domain) then return true
	end tell
	return false
end appExists

set filePath to (POSIX path of (path to home folder)) & "/.dotfiles/extra/minimize.list"
set applicationList to (read filePath as Çclass utf8È using delimiter linefeed) as list

repeat with appName in applicationList
	if appExists(appName) then
		tell application "System Events"
			repeat until window 1 of process appName exists
				delay 1
			end repeat
		end tell
		tell application "Finder" to set visible of process appName to false
		display notification "Minimized " & appName
	end if
end repeat
