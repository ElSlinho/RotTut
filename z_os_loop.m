% Z axis force coefficients
% simple itteration

% function [C_Z] = z_os (koef,beta,sigma,theta)

w_w_old=5;
lambda_a_old=(w_i-w_w_old)/V_ta;
C_Z_old=w_w_old^2*2/V_ta^2; % hover

for i=0:10;
C_Z = -((B_T^3/3+mi^2*B_T/2)*theta_0+(B_T^4/4+mi^2*B_T^2/4)*theta_T...
	+(B_T^2/2+mi^2/4)*(1+epsilon_0)*((w_i-sqrt(C_Z_old*V_ta^2/2))/V_ta)...
	+(mi*B_T^2/2+mi^3/8)*B1+(B_T^2*mi/4*(1+epsilon_0))*p_a_)*sigma*a0/2;

	if abs(C_Z_old-C_Z)<=0.0001
	break

	else
	C_Z_old=abs(C_Z)
	end 
end
w_w=sqrt(abs(C_Z)*V_ta^2/2);% hover
lambda_a=(w_i-w_w)/V_ta;
