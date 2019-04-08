% Initiates all the necessary function to obtain moments, forces and waving 
% angles.
% comparison with BET and RotTut

clear all
clc

theta_T=	-8*pi/180;
theta_0_= 	[11 10 13 15 17]*pi/180;
A1_=		[3 2 2 3 4]*pi/180;
B1_= 		[-2 -2 -6 -8 -11]*pi/180;
mi_=		[0.0978 0.1821 0.3074 0.3619 0.4019];

global sigma a0 B_T epsilon_0
for h=1:length(theta_0_)
helikopter
brzine

mi=mi_(h);
u_i=mi*V_ta;
w_i=u_i*tan(abs(alfa_s));

theta_0=theta_0_(h);
A1=A1_(h);
B1=B1_(h);

z_os_bisekcija_kor

CL_=(-C_Z)/sigma;
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

beta_0_(h)=beta_0;
a1_(h)=a1;
b1_(h)=b1;

w_w=lambda_w*V_ta;
w_w_(h)=w_w;

C_Z_(h)=C_Z;
T_(h)=-C_Z_(h)*ro*pi*R^2*V_ta^2;

C_X_(h)=C_X;
C_Y_(h)=C_Y;
C_MX_(h)=C_MX;
C_MY_(h)=C_MY;
C_MZ_(h)=C_MZ;

end

rot_tut % TotTut results

% beta_0
figure
plot(mi_,beta_0_*180/pi)
set(gca,'fontsize',16)
hold on
plot(mi_,beta_0_rt*180/pi,'or')
xlabel('Advanment coefficient')
ylabel('Cone angle, beta_0 [deg]')
grid on
legend('{\fontsize{28} Closed form}','{\fontsize{28} BET}')
axis([0 0.5 0 7])
print -depsc beta_0_mi.eps

% a1
figure
plot(mi_,a1_*180/pi)
set(gca,'fontsize',16)
hold on
plot(mi_,a1_rt*180/pi,'or')
xlabel('Advanment coefficient')
ylabel('Longitudinal cyclic waving angle, a1 [deg]')
grid on
legend('{\fontsize{28} Closed form}','{\fontsize{28} BET}')
print -depsc a1_mi.eps

% b1
figure
plot(mi_,b1_*180/pi)
set(gca,'fontsize',16)
hold on
plot(mi_,b1_rt*180/pi,'or')
xlabel('Advanment coefficient')
ylabel('Laterla Cyclic waving angle, b1 [deg]')
grid on
legend('{\fontsize{28} Closed form}','{\fontsize{28} BET}')
print -depsc b1_mi.eps

% Induced velocity
figure
plot(mi_,w_w_)
set(gca,'fontsize',16)
hold on
plot(mi_,w_w_rt,'or')
xlabel('Advanment coefficient')
ylabel('Induced velocity, w_w [m/s]')
grid on
legend('{\fontsize{28} Closed form}','{\fontsize{28} BET}')
axis([0 0.5 0 5])
print -depsc w_w_mi.eps

% thrust
figure
plot(mi_,T_)
set(gca,'fontsize',16)
hold on
plot(mi_,T_rt,'or')
xlabel('Advanment coefficient')
ylabel('Thrust, T [N]')
grid on
legend('{\fontsize{28} Closed form}','{\fontsize{28} BET}','location','NorthWest')
axis([0 0.5 0 90000])
print -depsc T_mi.eps

%-----------------------------------------------------------

% X axis force
figure
plot(mi_,C_X_*ro*pi*R^2*V_ta^2)
set(gca,'fontsize',16)
hold on
plot(mi_,-X_rt,'or')
xlabel('Advanment coefficient')
ylabel('X force, Fx [N]')
grid on
legend('{\fontsize{28} Closed form}','{\fontsize{28} BET}','location','NorthWest')
print -depsc X_mi.eps

% Y axis force
figure
plot(mi_,C_Y_*ro*pi*R^2*V_ta^2)
set(gca,'fontsize',16)
hold on
plot(mi_,Y_rt,'or')
xlabel('Advanment coefficient')
ylabel('Y force, Fy [N]')
grid on
legend('{\fontsize{28} Closed form}','{\fontsize{28} BET}')
axis([0 0.5 -5000 0])
print -depsc Y_mi.eps

% X axis momentum
figure
plot(mi_,C_MX_*ro*pi*R^3*V_ta^2)
set(gca,'fontsize',16)
xlabel('Advanment coefficient')
ylabel('Momentum around X, Mx [Nm]')
grid on
print -depsc MX_mi.eps

% Y axis momentum
figure
plot(mi_,C_MY_*ro*pi*R^3*V_ta^2)
set(gca,'fontsize',16)
xlabel('Advanment coefficient')
ylabel('Momentum around Y, My [Nm]')
grid on
axis([0 0.5 -300 0])
print -depsc MY_mi.eps

% Z axis momentum
figure
plot(mi_,C_MZ_*ro*pi*R^3*V_ta^2)
set(gca,'fontsize',16)
hold on
plot(mi_,Q_rt,'or')
xlabel('Advanment coefficient')
ylabel('Momentum around Z, Q [Nm]')
grid on
legend('{\fontsize{28} Closed form}','{\fontsize{28} BET}','location','NorthWest')
axis([0 0.5 0 35000])
print -depsc Q_mi.eps

