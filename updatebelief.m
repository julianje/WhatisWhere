%Bayesian update of a belief distribution
%given an action, an observation, and a POMDP
%this should be read as: Under belief, I executed action and received observation from pomdp. Integrating this I now have newbelief
function newbelief = updatebelief(belief, observation, action, pomdp)
	newbelief=zeros(length(belief),1);
	for i=1:length(belief),
		%loop through states
		for loopstate=1:length(belief),
			term=pomdp.O(action,i,observation)*pomdp.T(action,loopstate,i)*belief(loopstate);
			newbelief(i)=newbelief(i)+term;
		end
	end
	%unless you were reasoning about an impossible scenario (in which the posterior becomes zero), the belief is normalized.
	if(sum(newbelief)>0),
		newbelief=newbelief/sum(newbelief);
	end
end
