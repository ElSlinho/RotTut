% waving angles for hovering

%function [beta_0,a1,b1] = beta (theta_0,theta_T,A1,B1,lambda_a,koef)

P=omega/omega_+sqrt(3/2*(eR/R)/(1-eR/R))+sqrt(K_beta/(I_b*omega^2))+sqrt(gama/8*tan(delta_3));


[Beta] = 	[P^2 gama/2*F_a1 0;
		0 gama/2*A_a1 (1-P^2);
		gama/2*B_beta0 (1-P^2) -gama/2*B_b1]...

		\([gama/2*F_0 gama/2*F_T 0 gama/2*F_B1;
		gama/2*A_0 gama/2*A_T 0 gama/2*A_B1;
		0 0 gama/2*B_A1 0] * [theta_0; theta_T; A1; B1]...

		+[gama/2*F_lambda gama/2*F_P 0;
		gama/2*A_lambda gama/2*A_P 0;
		0 0 gama/2*B_q] * [lambda_a; p_a_; q_a_]...

		+[0 0;
		0 -2;
		2 0] * [p_i_; q_i_]);


beta_0=Beta(1);
a1=Beta(2);
b1=Beta(3);
