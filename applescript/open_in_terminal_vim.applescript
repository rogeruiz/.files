on run { input, parameters }

    set myPath to POSIX path of ( input as string )
    set cmd to "/usr/local/bin/vim " & quote & myPath & quote

    tell application "iTerm"

        activate
        set myTerm to ( make new terminal )

        tell myTerm

            set mySession to ( make new session at the end of sessions )
            tell mySession to exec command cmd

        end tell

    end tell

end run
