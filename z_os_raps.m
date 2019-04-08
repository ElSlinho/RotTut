% Z axis force coefficients 
% Newton-Raphson method

% function [C_Z] = z_os (koef,beta,sigma,theta)

w_w0=sqrt((m+m_t)/(2*ro*pi*R^2));
u_i=mi*V_ta;
u_0=u_i/cos(abs(alfa_s));
w_i=u_i*tan(abs(alfa_s));
w_0=w_i*sin(abs(alfa_s));

mi_=u_0/w_w0;
eta_=w_0/w_w0;
% w_ se trazi, a za pocetak se pretpostavi
beta_T=pi/2-abs(alfa_s);
%w_w=8;
%w_=w_w/w_w0;
w0=[0 5];

FUN=w_^4+2*(mi_*cos(beta_T)-eta_*sin(beta_T))*w_^3+(mi_^2+eta_^2)*w_^2-1;
w_ = fzero (FUN,w0);

w_w=w_*w_w0;
lambda_a=(w_i-w_w)/V_ta;

C_Z = -((B_T^3/3+mi^2*B_T/2)*theta_0+(B_T^4/4+mi^2*B_T^2/4)*theta_T...
	+(B_T^2/2+mi^2/4)*(1+epsilon_0)*(lambda_a)+(mi*B_T^2/2+mi^3/8)*B1...
	+(B_T^2*mi/4*(1+epsilon_0))*p_a_)*sigma*a0/2;
