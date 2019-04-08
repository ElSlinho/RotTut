% waving angles for hovering

%function [beta_0,a1,b1] = beta (theta_0,theta_T,A1,B1,lambda_a,koef)

[Beta] = 	[	gama/2*F_0			gama/2*F_T		0		gama/2*F_B1;
			A_0/A_a1			A_T/A_a1		0		A_B1/A_a1;
			gama/2*B_beta0/B_b1*F_0		gama/2*B_beta0/B_b1*F_T	-B_A1/B_b1	gama/2*B_beta0/B_b1*F_B1]...
		*[theta_0; theta_T; A1; B1]...

		+[	gama/2*F_lambda			gama/2*F_P		0;
			A_lambda/A_a1			A_P/A_a1		0;
			gama/2*B_beta0/B_b1*F_lambda	gama/2*B_beta0*B_b1*F_P	-B_q/B_b1]...
		*[lambda_a; p_a_; q_a_]...

		+[	0				0;
			0				-4/(gama*A_a1);
			-4/(gama*B_b1)			0]...
		*[p_i_; q_i];

beta_0=Beta(1);
a1=Beta(2);
b1=Beta(3);
