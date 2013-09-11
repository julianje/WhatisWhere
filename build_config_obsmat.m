%Receives a POMDP and returns a list where vector i contains an array with observations that can occur in state i (regardless of location). This function helps optimize sparse pomdp structures. 
function obsmat = build_config_obsmat(pomdp)
	obsmat=zeros(pomdp.cs,length(pomdp.O(1,1,:)));
 	pl=floor(length(pomdp.T(1,1,:))/pomdp.cs);
	for i=1:pomdp.cs,
		%get submatrix of rows indicating same configuration but different physical location, add them up and get all the places where an observation has chance greater than zero, then replace those values for 1 in the obsmat
		obsmat(i,find(sum(pomdp.O(1,((0:(pl-1))*pomdp.cs)+i,:))))=1;
	end
end
