function [th] = armIK

%Link length
L1 = input('value of link1 ...');
L2 = input('value of link2 ...');
L3 = input('value of link3 ...');
%Position input of the end effector
px = input('value of px ...');
py = input('value of py ...');
pz = input('value of pz ...');


%calc theta1
th1 = atan2(py, px);

%calc theta3
r = sqrt(px^2 + py^2);
k = sqrt(r^2 + (pz - 1));
th3 = acos((k^2 - L2^2 - L3^2)/(2*L2*L3));

%calc theta2
beta = atan2(pz - L1, r);
alpha = atan2(L3 * sin(th3) , L2 + L3*cos(th3) );
th2 = beta - alpha;

th1 = rad2deg(th1);
th3 = rad2deg(th3);
th2 = rad2deg(th2);
th = [th1, th2, th3];

