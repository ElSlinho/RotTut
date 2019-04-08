% Initiates all the necessary function to obtain moments, forces and waving 
% angles.
% Writes results for variables p, q i r

clear all
clc

p_ii=	[0:0.1:1];
q_ii=	[0:0.1:1];
r_ii=	[0:0.1:1];

global sigma a0 B_T epsilon_0
for ii=1:3

for kk=1:length(p_ii)

if 	ii==1	% changed by 'p'
	q_i=0; r_i=0; p_i=p_ii(kk);
elseif	ii==2	% changed by 'q'
	p_i=0; r_i=0; q_i=q_ii(kk);
else 		% changed by 'r'
	p_i=0; q_i=0; r_i=r_ii(kk); 
end

helikopter

%--------------------------------------------
%u_i=0;	% x axis
v_i=0;	% y axis
%w_i=0;	% z axis
%p_i=0;	% around x axis
%q_i=0;	% around y axis
%r_i=0;	% around z axis
% Induced velocities
u_w=0;	
v_w=0;	
%w_w=0; % in z_os_loop	
p_w=0;	
q_w=0;	
r_w=0;
% Aerodynamic velocities
%u_a=u_i-u_w;
v_a=v_i-v_w;
%w_a=w_i-w_w;
p_a=p_i-p_w;
q_a=q_i-q_w;
r_a=r_i-r_w;

omega_a=omega-r_a;
omega_=omega-r_i;
V_ta=omega_a*R;

p_i_=p_i/omega_;
q_i_=q_i/omega_;
p_a_=p_a/omega_a;
q_a_=q_a/omega_a;

alfa_s=0*pi/180;
mi=0;%u_i/V_ta;
u_i=mi*V_ta;
w_i=u_i*tan(abs(alfa_s));
%------------------------------------------------------
theta_0=11*pi/180;
theta_T=-8*pi/180;
A1=0*pi/180;
B1=0*pi/180;
z_os_bisekcija_kor
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

% results
F_Z_(ii,kk)=C_Z*ro*pi*R^2*V_ta^2; %V_ta is changing with r_i!
beta_0_(ii,kk)=beta_0;
a1_(ii,kk)=a1;
b1_(ii,kk)=b1;
F_X_(ii,kk)=C_X*ro*pi*R^2*V_ta^2;
F_Y_(ii,kk)=C_Y*ro*pi*R^2*V_ta^2;
M_MX_(ii,kk)=C_MX*ro*pi*R^3*V_ta^2;
M_MY_(ii,kk)=C_MY*ro*pi*R^3*V_ta^2;
M_MZ_(ii,kk)=C_MZ*ro*pi*R^3*V_ta^2;

end
end

rot_tut_pqr

% -------------------------------------
figure
plot(p_ii,beta_0_(1,:)*180/pi,'x-')
grid on
hold on
plot(q_ii,beta_0_(2,:)*180/pi,'s-r')
plot(r_ii,beta_0_(3,:)*180/pi,'*-g')
plot(p_rt,beta_0_p*180/pi,'v')
plot(q_rt,beta_0_q*180/pi,'+r')
plot(r_rt,beta_0_r*180/pi,'og')
xlabel('Angular velocities [rad/s]')
ylabel('beta_0 [deg]')
legend('p','q','r','p BET','q BET','r BET')
axis([0 1 0 3])
print -depsc beta_0_pqr.eps

figure
plot(p_ii,a1_(1,:)*180/pi)
grid on
hold on
plot(q_ii,a1_(2,:)*180/pi,'r')
plot(r_ii,a1_(3,:)*180/pi,'g')
plot(p_rt,a1_p*180/pi,'v')
plot(q_rt,a1_q*180/pi,'+r')
plot(r_rt,a1_r*180/pi,'og')
xlabel('Angular velocities [rad/s]')
ylabel('a1 [deg]')
legend('p','q','r','p BET','q BET','r BET','location','NorthWest')
%axis([])
print -depsc a1_pqr.eps

figure
plot(p_ii,b1_(1,:)*180/pi)
grid on
hold on
plot(q_ii,b1_(2,:)*180/pi,'r')
plot(r_ii,b1_(3,:)*180/pi,'g')
plot(p_rt,b1_p*180/pi,'v')
plot(q_rt,b1_q*180/pi,'+r')
plot(r_rt,b1_r*180/pi,'og')
xlabel('Angular velocities [rad/s]')
ylabel('b1 [deg]')
legend('p','q','r','p BET','q BET','r BET','location','SouthWest')
axis([0 1 -4 0.5])
print -depsc b1_pqr.eps

figure
plot(p_ii,F_X_(1,:))
grid on
hold on
plot(q_ii,F_X_(2,:),'r')
plot(r_ii,F_X_(3,:),'g')
plot(p_rt,-Fx_p,'v')
plot(q_rt,-Fx_q,'+r')
plot(r_rt,-Fx_r,'og')
xlabel('Angular velocities [rad/s]')
ylabel('F_X [N]')
legend('p','q','r','p BET','q BET','r BET','location','SouthWest')
%axis([])
print -depsc Fx_pqr.eps

figure
plot(p_ii,F_Y_(1,:))
grid on
hold on
plot(q_ii,F_Y_(2,:),'r')
plot(r_ii,F_Y_(3,:),'g')
plot(p_rt,Fy_p,'v')
plot(q_rt,Fy_q,'+r')
plot(r_rt,Fy_r,'og')
xlabel('Angular velocities [rad/s]')
ylabel('F_Y [N]')
legend('p','q','r','p BET','q BET','r BET','location','SouthWest')
axis([0 1 -1500 100])
print -depsc Fy_pqr.eps

figure
plot(p_ii,-F_Z_(1,:),'x-')
grid on
hold on
plot(q_ii,-F_Z_(2,:),'s-r')
plot(r_ii,-F_Z_(3,:),'*-g')
plot(p_rt,T_p,'v')
plot(q_rt,T_q,'+r')
plot(r_rt,T_r,'og')
xlabel('Angular velocities [rad/s]')
ylabel('F_Z [N]')
legend('p','q','r','p BET','q BET','r BET','location','SouthWest')
axis([0 1 0 27000])
print -depsc Fz_pqr.eps

figure
plot(p_ii,M_MX_(1,:),'o-')
grid on
hold on
plot(q_ii,M_MX_(2,:),'s-r')
plot(r_ii,M_MX_(3,:),'*-g')
xlabel('Angular velocities [rad/s]')
ylabel('M_X [Nm]')
legend('p','q','r','location','SouthWest')
axis([0 1 -150000 10000])
print -depsc Mx_pqr.eps

figure
plot(p_ii,M_MY_(1,:),'x-')
grid on
hold on
plot(q_ii,M_MY_(2,:),'s-r')
plot(r_ii,M_MY_(3,:),'*-g')
xlabel('Angular velocities [rad/s]')
ylabel('M_Y [Nm]')
legend('p','q','r','location','NorthWest')
axis([0 1 -10000 150000])
print -depsc My_pqr.eps

figure
plot(p_ii,M_MZ_(1,:),'x-')
grid on
hold on
plot(q_ii,M_MZ_(2,:),'s-r')
plot(r_ii,M_MZ_(3,:),'*-g')
plot(p_rt,Q_p,'v')
plot(q_rt,Q_q,'+r')
plot(r_rt,Q_r,'og')
xlabel('Angular velocities [rad/s]')
ylabel('Q [Nm]')
legend('p','q','r','p BET','q BET','r BET','location','SouthWest')
axis([0 1 0 20000])
print -depsc Q_pqr.eps




