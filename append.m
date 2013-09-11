%This function transforms a MOMDP state description to the POMDP state description
%it receives believed configuration c, physical location l, and the amount of possible configurations.
%The POMDP description state space is a vector appending l1*c l2*c .... So all that needs to be done is shift physical location by the size of configurations and then moves to the given configuration
function state = append(c,l,csize)
	state = ((l-1)*csize)+c;
end
