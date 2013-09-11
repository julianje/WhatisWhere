%Pushes the observer's configuration and belief into a POMDP belief distribution
function newbelief = pushconfig(belief, l, pomdp)
    newbelief=zeros(1,length(pomdp.prior));
    newbelief(((l-1)*pomdp.cs+1):l*pomdp.cs)=belief;
end
