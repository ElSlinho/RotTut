% X axis momentum coefficients

% function [C_MX] = x_os_mom (koef,beta,sigma,theta)

C_MX = (-(B_T^3*mi/3)*theta_0-(B_T^4*mi/4)*theta_T-(B_T^2*mi/4)*lambda_a-(B_T^4/8)*p_a_...
	-(B_T^4/8+3*B_T^2*mi^2/16)*B1+(B_T^4/8-B_T^2*mi^2/16)*a1)*sigma*a0/2;
