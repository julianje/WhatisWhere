%This function calculates the probability of an observation history given the configuration of the environment and a history of locations
%it receives an observation vector, a location vector, a scalar indicating the configuration state, the amount of possible configurations, and a pomdp structure. The pomdp structure should be built using Tony's file format and transformed using the build_matlab_pomdp.pl perl policy that is provided with this code
function p = p_obs(o,l,c,pomdp)
	p=prod(arrayfun(@(c,l,o,cs) pomdp.O(1,append(c,l,cs),o),ones(1,length(l))*c,l,o,ones(1,length(l))*pomdp.cs));
end
