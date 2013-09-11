%Receives a POMDP and returns a list where vector i contains an array with observations that can occur in location i (regardless of state). This function helps optimize sparse pomdp structures. 
function obsmat = build_loc_obsmat(pomdp)
	pl=floor(length(pomdp.T(1,1,:))/pomdp.cs);
	obsmat=zeros(pl,length(pomdp.O(1,1,:)));
	for i=1:pl,
 		obsmat(i,find(sum(pomdp.O(1,[((i-1)*pomdp.cs+1):i*pomdp.cs],:))))=1;
	end
end
