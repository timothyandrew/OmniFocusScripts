property author : "Timothy Andrew"
property version : "1.0"
property name : "add/remove individual tags"

use omniLib : script "omnifocuslib"

on run argv
	tell front document of application "OmniFocus"
		set waitingTag to the first flattened tag where its name = "Waiting For 🌀"
		set validSelectedItemsList to omniLib's getSelectedActions()
		
		repeat with taskOne in validSelectedItemsList
			set existing to tag of taskOne
      set ex to false
			
			repeat with existingTag in existing
				if name of existingTag is equal to name of waitingTag then
          set ex to true
				end if
			end repeat
			

      if ex then
        remove waitingTag from tag of taskOne
      else
        add waitingTag to tag of taskOne
      end if
		end repeat
	end tell
end run
