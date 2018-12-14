property author : "Timothy Andrew"
property version : "1.0"
property name : "add/remove priority tags"

use omniLib : script "omnifocuslib"

on run argv
	tell front document of application "OmniFocus"
		set p1Tag to the first flattened tag where its name = "p1 ‼️"
		set p2Tag to (first flattened tag where its name is "p2 ⚠️")
		set p3Tag to (first flattened tag where its name is "p3 ❇️")
		set soonTag to (first flattened tag where its name is "Soon 🏎")
		set anytimeTag to (first flattened tag where its name is "Anytime 🚙")
		set somedayTag to (first flattened tag where its name is "Someday 🛴")

		set toaddTag to (first flattened tag where its name is item 1 of argv)

		set validSelectedItemsList to omniLib's getSelectedActions()

		repeat with taskOne in validSelectedItemsList
			remove p1Tag from tag of taskOne
			remove p2Tag from tag of taskOne
			remove p3Tag from tag of taskOne
			remove soonTag from tag of taskOne
			remove anytimeTag from tag of taskOne
			remove somedayTag from tag of taskOne

			add toaddTag to tag of taskOne
		end repeat
	end tell
end run
