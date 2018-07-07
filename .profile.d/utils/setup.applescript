tell application "iTerm"
	set newWindow to (create window with default profile)
	tell current session of newWindow
		write text "$HOME/.profile.d/.setup && exit 0"
	end tell
end tell
