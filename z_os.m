% Z axis force coefficients

% function [C_Z] = z_os (koef,beta,sigma,theta)

C_Z = -((B_T^3/3+mi^2*B_T/2)*theta_0+(B_T^4/4+mi^2*B_T^2/4)*theta_T...
	+(B_T^2/2+mi^2/4)*(1+epsilon_0)*(lambda_a)+(mi*B_T^2/2+mi^3/8)*B1...
	+(B_T^2*mi/4*(1+epsilon_0))*p_a_)*sigma*a0/2;
