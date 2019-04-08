% Initiates all the necessary function to obtain moments, forces and waving 
% angles.
clear all
clc

theta_T=0;
A1=0;
B1=0;

theta_0_=(0:0.1:15)*pi/180;
sigma_=[0.0424 0.0636 0.0849 0.1061];

global sigma a0 B_T epsilon_0
for h=1:length(sigma_)
for l=1:length(theta_0_);
theta_0=theta_0_(l);

helikopter
sigma=sigma_(h);
brzine
%postavni
z_os_bisekcija_kor
CL_=6*(-C_Z)/sigma;
CD_=0.0105+0.01325*CL_^2;
epsilon_0=CD_/a0;
%z_os_loop
%z_os_raps
koeficijenti
beta_dreier
x_os
y_os
%z_os
x_os_mom
y_os_mom
z_os_mom
C_Z_(l,h)=C_Z;

C_MZ_(l,h)=C_MZ;
end
end

[CTx,CPx,CTCP]=CT_CP_exp; % experiemntal solutions for hovering

% C_T - Theta_0
figure
plot(theta_0_*180/pi,-C_Z_(:,1),'k')
set(gca,'fontsize',16)
hold on
plot(theta_0_*180/pi,-C_Z_(:,2))
plot(theta_0_*180/pi,-C_Z_(:,3),'r')
plot(theta_0_*180/pi,-C_Z_(:,4),'g')
grid on 
xlabel('theta_0 [deg]')
ylabel('C_T')
legend('{\fontsize{28} sigma=0.0424}','{\fontsize{28} sigma=0.0636}','{\fontsize{28} sigma=0.0849}','{\fontsize{28} sigma=0.1061}','Location','NorthWest')
plot(CTx.sigma042(:,1),CTx.sigma042(:,2),'ko')
plot(CTx.sigma064(:,1),CTx.sigma064(:,2),'v')
plot(CTx.sigma085(:,1),CTx.sigma085(:,2),'rs')
plot(CTx.sigma106(:,1),CTx.sigma106(:,2),'gd')
axis([0 15 0 0.014])
print -depsc C_T_theta_0.eps

% C_P - Theta_0
figure
plot(theta_0_*180/pi,C_MZ_(:,1),'k')
set(gca,'fontsize',16)
hold on
plot(theta_0_*180/pi,C_MZ_(:,2)) 
plot(theta_0_*180/pi,C_MZ_(:,3),'r')
plot(theta_0_*180/pi,C_MZ_(:,4),'g')
grid on 
xlabel('theta_0 [deg]')
ylabel('C_P')
legend('{\fontsize{28} sigma=0.0424}','{\fontsize{28} sigma=0.0636}','{\fontsize{28} sigma=0.0849}','{\fontsize{28} sigma=0.1061}','Location','NorthWest')
plot(CPx.sigma042(:,1),CPx.sigma042(:,2),'ko')
plot(CPx.sigma064(:,1),CPx.sigma064(:,2),'v')
plot(CPx.sigma085(:,1),CPx.sigma085(:,2),'rs')
plot(CPx.sigma106(:,1),CPx.sigma106(:,2),'gd')
axis([0 15 0 0.0014])
print -depsc C_P_theta_0.eps

% C_P/sigma - C_T/sigma:w

%figure
%plot(-C_Z_(:,1)/sigma_(1),C_MZ_(:,1)/sigma_(1))
%xlabel('C_T / sigma')
%ylabel('C_P / sigma')
%grid on




