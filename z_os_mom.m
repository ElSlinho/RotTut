% Z axis momentum coefficients - split into three parts or easier
% understanding

% function [C_MZ] = z_os_mom (koef,beta,sigma,theta)

% 1.) C_Q_0 ---------------------------------
Q_epsilon=	(B_T^4/4+B_T^2*mi^2/4);
Q_lambda=	(B_T^3/3)*theta_0+(B_T^4/4)*theta_T+(B_T^2/2)*lambda_a;
Q_beta02=	(B_T^2*mi^2/4);
Q_a12=		(B_T^4/8+3*B_T^2*mi^2/16);
Q_b12=		(B_T^4/8+B_T^2*mi^2/16);
Q_beta0_b1=	(B_T^3*mi/3);
Q_a1_lambda=	(B_T^2*mi/2);

C_Q_0 = ((Q_epsilon*epsilon_0 - Q_lambda*lambda_a - Q_beta02*beta_0^2 - Q_a12*a1^2 - Q_b12*b1^2)...
	+ Q_beta0_b1*beta_0*b1 - Q_a1_lambda*a1*lambda_a)*sigma*a0/2;
% ----------------------------------------

% 2.) C_Q_cyclic -------------------------
Q_B1_a1=	(B_T^4/8-B_T^2*mi^2/16);
Q_B1_lambda=	(B_T^2*mi/4);
Q_A1_beta0=	(B_T^3*mi/6);
Q_A1_b1=	(B_T^4/8+B_T^2*mi^2/16);

C_Q_cyclic = (Q_B1_a1*B1*a1 - Q_B1_lambda*B1*lambda_a + Q_A1_beta0*A1*beta_0 - Q_A1_b1*A1*b1)*sigma*a0/2;
% ----------------------------------------

% 3.) C_Q_pq -----------------------------
Q_p=		(-B_T^4/8*B1-B_T^3*mi/6*theta_0-B_T^4*mi/8*theta_T-B_T^4/8*p_a_+B_T^4/4*a1);
Q_q=		(-B_T^4/8*A1+B_T^3*mi/3*beta_0-B_T^4/8*p_a_-B_T^4/4*b1);

C_Q_pq = (Q_p*p_a_ + Q_q*q_a_)*sigma*a0/2;
% ----------------------------------------

% C_MZ -----------------------------------
C_MZ = ( C_Q_0 + C_Q_cyclic + C_Q_pq );
% ----------------------------------------
