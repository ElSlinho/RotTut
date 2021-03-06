function [F,CT] = thr_ind_bisect (theta_0, theta_T, lambda_i, lambda_w, B1, p_a_, mi)
% thr_ind_bisect - 'thrust' i 'induced velocity' funkcija za mt. bisekcije

global sigma a0 B_T epsilon_0

CT = ( (B_T^3/3+mi^2*B_T/2)*theta_0 ...
     + (B_T^4/4+mi^2*B_T^2/4)*theta_T ...
	 + (B_T^2/2+mi^2/4)*(1+epsilon_0)*(lambda_i-lambda_w) ...
	 + (mi*B_T^2/2+mi^3/8)*B1 ...
	 + (B_T^2*mi/4*(1+epsilon_0))*p_a_)*sigma*a0/2;

F = 2*lambda_w*(mi^2+(lambda_i-lambda_w)^2)^(1/2)-CT;
