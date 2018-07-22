#!/usr/bin/osascript

set filePath to (POSIX path of (path to home folder)) & "/.dotfiles/extra/minimize.list"
set applicationList to (read filePath as Çclass utf8È using delimiter linefeed) as list
repeat with appName in applicationList
	tell application "System Events"
		repeat until window 1 of process appName exists
			delay 1
		end repeat
	end tell
	tell application "Finder" to set visible of process appName to false
	display notification "Minimized " & appName
end repeat
