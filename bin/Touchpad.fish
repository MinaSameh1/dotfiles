#!/bin/fish
for OPTION in TapButton1 TapButton2 VertEdgeScroll HorizTwoFingerScroll HorizEdgeScroll
	synclient $OPTION=1
end

synclient MaxSpeed=1.80
synclient MinSpeed=1.10
