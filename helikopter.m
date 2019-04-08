% Helicopter data

% SA 330 Puma --------------------------
R=7.5;		% [m] blade radius
m=3536; 	% [kg] empty helicopter mass
m_t=2269;	% [kg] freight mass
b=4;		% number of blades
c=0.54;		% [m] chord length
R0=1.75;	% [m] root blade redius
omega=28.3;	% [rad(?)/s] rotation speed (Zupan) 
CD_=0.015;	% average rotor drag coefficient (http://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/19830010377_1983010377.pdf - str. 136)
a0=5.73;	% angle of attack cl_alfa
I_b=1280;	% [kgm^2] inertia moment around the waving joint
K_beta=33032;	% [Nm/rad] spring coef.
delta_3=0;%45*pi/180;	% [deg]
eR=0.038*R;	% waving joint excenter
%----------------------------------------

% Bell 206 UNFINISHED -------------------
%R=10.16/2	% [m] blade radius
%m=1057; 	% [kg] empty helicopter mass
%m_t=300;	% [kg] freight mass
%b=2;		% number of blades
%c=0.54;		% [m] chord length
%R0=1.75;	% [m] root blade redius
%omega=28.3;	% [rad(?)/s] rotation speed (Zupan) 
%CD_=0.009;	% average rotor drag coefficient (http://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/19830010377_1983010377.pdf - str. 136)
%a0=5.73;	% angle of attack cl_alfa
%I_b=1280;	% [kgm^2] inertia moment around the waving joint
%----------------------------------------

% ----------------------------
A_b=(R-R0)*c;	% blade surface area
g=9.81;		% gravity
V_ta=omega*R;	% [m/s] blade tip speed
epsilon_0=CD_/a0;
sigma=b*c/(pi*R);% solidification coefficient. surface ratio
H=0;		% Flight height. Dreier's "Rotor-tutor" is using 0m
[T,p,ro,a] = ISO (H);
B_T=0.97;%-(sqrt(2*((m+m_t)*g)/(ro*pi*V_ta^2*R^2))/b)
gama=9.374;%ro*c*a0*R^4/I_b % Lock number. Padfield for 0 m - 9.374. has a rather strong relation to height and can give rather different results.
% -----------------------------

