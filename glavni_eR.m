% Initiates all the necessary function to obtain moments, forces and waving 
% angles.

clear all
clc

global sigma a0 B_T epsilon_0

eR_=[0:0.002:0.038];

for h=1:length(eR_)
helikopter
eR=eR_(h)*R;
brzine
postavni
z_os_bisekcija_kor

CL_=(-C_Z)/sigma;
CD_=0.0105+0.01325*CL_^2;
epsilon_0=CD_/a0;

%z_os_loop
%z_os_raps
koeficijenti
beta_dreier_prosireni
x_os
y_os
%z_os
x_os_mom
y_os_mom
z_os_mom
C_MX_(h)=C_MX;
end

figure
plot(eR_*R,C_MX_)
xlabel('e*R [m]')
ylabel('M_x [Nm]')
print -depsc Mx_eR.eps

