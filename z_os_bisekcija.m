% Z axis force coefficients - bisection

% function [C_Z] = z_os (koef,beta,sigma,theta)

itermax=1000; % maksimalan broj iteracija. postavljen je velik jer kasnije u proracunu on predstavlja intermax-ti dio porasta lambde
w_w0=sqrt((m+m_t)*g/(2*ro*pi*R^2)); % inducirana brzina u lebdenju
lambda_hover=(w_i-w_w0)/V_ta;
% --------------- pocetni uvijeti ----------------------
lambda_R=20*lambda_hover;
lambda_L=-lambda_R;

lambda_i=w_i/V_ta;

lambda_w=lambda_L;
C_Z_L = -((B_T^3/3+mi^2*B_T/2)*theta_0+(B_T^4/4+mi^2*B_T^2/4)*theta_T...
	+(B_T^2/2+mi^2/4)*(1+epsilon_0)*(lambda_i-lambda_w)+(mi*B_T^2/2+mi^3/8)*B1...
	+(B_T^2*mi/4*(1+epsilon_0))*p_a_)*sigma*a0/2;
f_lw= 2*lambda_w*(mi^2+(lambda_i-lambda_w)^2)^(1/2)+C_Z_L;
F_L=f_lw;

lambda_w=lambda_R;
C_Z_R = -((B_T^3/3+mi^2*B_T/2)*theta_0+(B_T^4/4+mi^2*B_T^2/4)*theta_T...
	+(B_T^2/2+mi^2/4)*(1+epsilon_0)*(lambda_i-lambda_w)+(mi*B_T^2/2+mi^3/8)*B1...
	+(B_T^2*mi/4*(1+epsilon_0))*p_a_)*sigma*a0/2;
f_lw= 2*lambda_w*(mi^2+(lambda_i-lambda_w)^2)^(1/2)+C_Z_R;
F_R=f_lw;

%lambda_M=(lambda_L+lambda_R)/2;

if sign(F_L)~=sign(F_R)
for i=1:itermax;
lambda_M=(lambda_L+lambda_R)/2;
lambda_w=lambda_M
C_Z_M = -((B_T^3/3+mi^2*B_T/2)*theta_0+(B_T^4/4+mi^2*B_T^2/4)*theta_T...
	+(B_T^2/2+mi^2/4)*(1+epsilon_0)*(lambda_i-lambda_w)+(mi*B_T^2/2+mi^3/8)*B1...
	+(B_T^2*mi/4*(1+epsilon_0))*p_a_)*sigma*a0/2;
f_lw= 2*lambda_w*(mi^2+(lambda_i-lambda_w)^2)^(1/2)+C_Z_M;
F_M=f_lw;
lambda_L_old=lambda_L;
lambda_R_old=lambda_R;
	if abs(F_M)>=0.0001
		if sign(F_L)==sign(F_M)
		lambda_L=lambda_L_old-(1/itermax)*i*lambda_L_old;
		elseif sign(F_L)~=sign(F_M) % ~= je nejednako
		lambda_R=lambda_R_old-(1/itermax)*i*lambda_R_old;
		end
	else
	break
	end
end
else disp('F_R i F_L moraju imati razliciti predznak, promijeni vrijednosti lambda_L i/ili lambda_R')
end

C_Z=C_Z_M;
w_w=V_ta*lambda_w;
lambda_a=lambda_i-abs(lambda_w);
