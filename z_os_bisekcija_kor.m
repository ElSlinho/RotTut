global sigma a0 B_T epsilon_0

% Z axis force coefficients - bisection

% function [C_Z] = z_os (koef,beta,sigma,theta)

itermax=30; % maksimalan broj iteracija
w_w0=sqrt((m+m_t)*g/(2*ro*pi*R^2)); % inducirana brzina u lebdenju - prema [ref:m.v. poz.prema dole]
lambda_hover=(-w_w0)/V_ta; % inertial velocity =0 for hover
% --------------- pocetni uvijeti ----------------------
lambda_R=20*lambda_hover;
lambda_L=-lambda_R;

lambda_i=w_i/V_ta;

[F_L,CT_L] = thr_ind_bisect (theta_0,theta_T,lambda_i,lambda_L,B1,p_a_,mi);
[F_R,CT_R] = thr_ind_bisect (theta_0,theta_T,lambda_i,lambda_R,B1,p_a_,mi);

if (sign(F_L)) == (sign(F_R))
	disp('F_R i F_L moraju imati razliciti predznak, promijeni vrijednosti lambda_L i/ili lambda_R')
	break
end

for i=1:itermax;
    lambda_M=(lambda_L+lambda_R)/2;

	[F_M,CT_M] = thr_ind_bisect (theta_0,theta_T,lambda_i,lambda_M,B1,p_a_,mi);

    if abs(F_M)>=1e-7
    	if sign(F_L)==sign(F_M)
    		lambda_L=lambda_M; 
    	elseif sign(F_L)~=sign(F_M) % ~= je nejednako
    		lambda_R=lambda_M;
    	end
	else
		lambda_w=lambda_M;
		break
	end
end

%C_Z=C_Z_M;
C_Z=-CT_M;
lambda_a=lambda_i-abs(lambda_w); % ??????





