#!/usr/bin/osascript

tell application "Terminal"
	-- Start Terminal
	activate
	if not (exists window 1) then reopen
	
	-- Start script, exit tab at the end if OK
	set s to do script "clear; $HOME/.dotfiles/bin/setup && echo 'Script terminated successfully'" in window 1
	
	-- Wait for script to end
	repeat
		delay 1
		if not busy of s then exit repeat
	end repeat
	
	-- Display notification and quit Terminal if no window, display dialog otherwise
	tell window 1 to set output to contents of selected tab as string
	if output contains "Script terminated successfully" then
		display notification "' Script terminated successfully!" with title "Setup script"
		quit window 1
	else
		display dialog "' An error occured. See Terminal for details." with title "Setup script"
	end if
end tell
