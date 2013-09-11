%a and o MUST have the same length (meaning you don't have the latest observation)

%This function calculates the probability of an action history given the configuration of the environment and a history of observations
%it receives an observation vector, a location vector, a scalar indicating the configuration state, a vector of actions, and a BToM (optimal policy structure) to see if actions are reasonable with the observations. The BToM structure should be built using the build_matlab_policy.pl perl policy that is provided with this code
function p = p_act(a,o,belief,btom,pomdp,index)
	%Run policy
	p=1;
	%for each observation
	for ol = 2:length(o)
		%took action a(ol-1) and got observation o(ol)
		belief=updatebelief(belief,o(ol),a(ol-1),pomdp);
		policyvals=btom{index}.vectors*belief;
		%vector of all possible actions
		action=btom{index}.actions(find(policyvals == max(policyvals)))+1;
		action=unique(action);
		%disp('expected action:');
		%disp(action);
		%check is action was one of the possible ones
		if ~any(action == a(ol)),
			p=0;
			ol=length(o)+1;
		else
			p=p*(1/length(action));
		end
	end
end
