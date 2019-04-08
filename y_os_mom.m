% Y axis momentum coefficients

% function [C_MY] = y_os_mom (koef,beta,sigma,theta)

C_MY = ((B_T^3*mi/6)*beta_0-(B_T^4/8)*q_a_-(B_T^4/8+B_T^2*mi^2/16)*A1...
	-(B_T^4/8+B_T^2*mi^2/16)*b1)*sigma*a0/2;
