% Coefficients

F_omega=omega_a/omega_;
%lambda_a=-sqrt(C_Z*V_ta^2/2)/V_ta; % -w_w/V_ta; trebalo bi biti w_a/V_ta (w_a=w_i-w_w). paziti na predznak ako je samo inducirana, odn. ne zaboraviti minus

F_0=		F_omega^2*(B_T^4/4+B_T^2*mi^2/4);
F_T=		F_omega^2*(B_T^5/5+B_T^3*mi^2/6);
F_lambda=	F_omega^2*(B_T^3/3)*(1+epsilon_0);
F_B1=		F_omega^2*(B_T^3*mi/3);
F_P=		F_omega^2*(B_T^3*mi/6)*(1+epsilon_0);
F_a1=		F_omega^2*(mi*B_T^3/(6*F_omega))...
		*(1+epsilon_0)*(1-F_omega);

A_0=		F_omega^2*(2*B_T^3*mi/3);
A_T=		F_omega^2*(B_T^4*mi/2);
A_lambda=	F_omega^2*(B_T^2*mi/2-(mi^3/8))*(1+epsilon_0);
A_B1=		F_omega^2*(B_T^4/4+3*B_T^2*mi^2/8);
A_P=		F_omega^2*(B_T^4/4)*(1+epsilon_0);
A_a1=		F_omega^2*(B_T^4/(4*F_omega)-B_T^2*mi^2/8)...
		*(1+epsilon_0);

B_beta0=	F_omega^2*(B_T^3*mi/3)*(1+epsilon_0);
B_A1=		F_omega^2*(B_T^4/4+B_T^2*mi^2/8);
B_q=		F_omega^2*(B_T^4/4)*(1+epsilon_0);
B_b1=		F_omega^2*(B_T^4/(4*F_omega)+B_T^2*mi^2/8)...
		*(1+epsilon_0);

