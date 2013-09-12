%Parameters
joint_inference=1
path=1
%Load the observer model of the world
run('Policies/p1_matlab_pomdp.m')
p1_POMDP.cs=24;
disp('Configuration Size (cs) set to 24.');
%Load the family of policies
disp('Loading policies...');
run('Policies/p1_matlab_btom.m')
pols{1}=p1_btom;clear p1_btom;
if (joint_inference==1)
	run('../../Policies/p2_matlab_btom.m')
	pols{2}=p2_btom;clear p2_btom;
	run('../../Policies/p3_matlab_btom.m')
	pols{3}=p3_btom;clear p3_btom;
	run('../../Policies/p4_matlab_btom.m')
	pols{4}=p4_btom;clear p4_btom;
	run('../../Policies/p5_matlab_btom.m')
	pols{5}=p5_btom;clear p5_btom;
	run('../../Policies/p6_matlab_btom.m')
	pols{6}=p6_btom;clear p6_btom;
	run('../../Policies/p7_matlab_btom.m')
	pols{7}=p7_btom;clear p7_btom;
	run('../../Policies/p8_matlab_btom.m')
	pols{8}=p8_btom;clear p8_btom;
	run('../../Policies/p9_matlab_btom.m')
	pols{9}=p9_btom;clear p9_btom;
	run('../../Policies/p10_matlab_btom.m')
	pols{10}=p10_btom;clear p10_btom;
	run('../../Policies/p11_matlab_btom.m')
	pols{11}=p11_btom;clear p11_btom;
	run('../../Policies/p12_matlab_btom.m')
	pols{12}=p12_btom;clear p12_btom;
	run('../../Policies/p13_matlab_btom.m')
	pols{13}=p13_btom;clear p13_btom;
	run('../../Policies/p14_matlab_btom.m')
	pols{14}=p14_btom;clear p14_btom;
	run('../../Policies/p15_matlab_btom.m')
	pols{15}=p15_btom;clear p15_btom;
	run('../../Policies/p16_matlab_btom.m')
	pols{16}=p16_btom;clear p16_btom;
	run('../../Policies/p17_matlab_btom.m')
	pols{17}=p17_btom;clear p17_btom;
	run('../../Policies/p18_matlab_btom.m')
	pols{18}=p18_btom;clear p18_btom;
	run('../../Policies/p19_matlab_btom.m')
	pols{19}=p19_btom;clear p19_btom;
	run('../../Policies/p20_matlab_btom.m')
	pols{20}=p20_btom;clear p20_btom;
	run('../../Policies/p21_matlab_btom.m')
	pols{21}=p21_btom;clear p21_btom;
	run('../../Policies/p22_matlab_btom.m')
	pols{22}=p22_btom;clear p22_btom;
end

disp('Building belief space');
if (joint_inference==1)
	bp=false_belief_set();
else
	bp = ones(1,24)/24;
end
bpb=ones(1,size(bp,1))/size(bp,1);
prior=ones(1,p1_POMDP.cs)/p1_POMDP.cs;
o=observer(prior,bp,bpb,p1_POMDP,pols,10);
%clean up
clear('bp','bpb','prior');
o=o.start_observing(19,6);
%Place here all possible paths from 1 to 19.
disp('Running path 6...');
o.action_array=[6 2 2 1 1 1 1 1 -1 -1 -1];
o.location_array=[19 4 5 6 5 4 3 2 1 -1 -1];
o=o.observe_action(4);
save('o6s.mat','o');
