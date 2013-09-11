%returns a matrix with size(location) columns where each row is an observation history
%This function requires the classcomb function. It is provided (as well as the licence) along with this code or can be obtained at http://www.mathworks.com/matlabcentral/fileexchange/10064
function obs_hist = build_obs_hist(l,obsmat)
	l2=unique(l);
	for i=1:length(l2),
		hist{i}=find(obsmat(l2(i),:));
	end
	simple_obs_hist=allcomb(hist{:});
	for i=1:length(simple_obs_hist),
		for j=1:length(l),
			%CAREFUL: THIS CODE ONLY IMPROVES THE FOODHALL POMDP. BREAKS ALL OTHERS.
			%reduce code for observations with physical shift
			switch l(j)
				case 7
					obs_hist(i,j)=simple_obs_hist(i,find(l2==1,1))+18;
				case 13
					obs_hist(i,j)=simple_obs_hist(i,find(l2==1,1))+36;
				case 10
					obs_hist(i,j)=simple_obs_hist(i,find(l2==1,1))+18;
				case 16
					obs_hist(i,j)=simple_obs_hist(i,find(l2==1,1))+36;
				case 12
					obs_hist(i,j)=simple_obs_hist(i,find(l2==1,1))+18;
				case 18
					obs_hist(i,j)=simple_obs_hist(i,find(l2==1,1))+36;
				otherwise
					obs_hist(i,j)=simple_obs_hist(i,find(l2==l(j),1));
			end
			%Use this line only when working on another POMDP
			%obs_hist(i,j)=simple_obs_hist(i,find(l2==l(j),1));
		end
	end
end
%arrayfun syntax in case the loop can be avoided using this
%arrayfun(@(inputvars) functionusinginputvars,inputvar1ARRAY,...,inputvarnARRAY)
