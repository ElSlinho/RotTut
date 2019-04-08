% Flight velocities

% velocities in the disc-plane
% Vlight velocities based on an imaginary CS
%u_i=0;	% x axis
v_i=0;	% y axis
%w_i=0;	% z axis
p_i=0;	% around x axis
q_i=0;	% around y axis
r_i=0;  % around z axis
% Induced velocities
u_w=0;	
v_w=0;	
%w_w=0; % using z_os_loop	
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

alfa_s=0*pi/180; % rotor angle of attack
mi=0;%u_i/V_ta;
u_i=mi*V_ta;
w_i=u_i*tan(abs(alfa_s));

