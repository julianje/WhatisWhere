%Return the new location given past location and action
%NOTE THAT SHIFT DEPENDS ON GRID SIZE
function newl = update_location(a,l)
	switch a
		case 1
			shift=-1;
		case 2
			shift=+1;
		case 3
			shift=-6;
		case 4
			shift=+6;
		%for POMDPs that have a "Start" action (such as fh family)
		case 6
			shift=4;l=0;
		%fixies because I mislabeled the fh family
		otherwise
			shift=0;
	end
	newl=l+shift;
end
