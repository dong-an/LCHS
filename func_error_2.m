function [err] = func_error_2(x,beta,Lk,H,H1)
%  Estimate the error of truncating the integral for a given matrix
%  Input: x: evolution time
%         beta: the decay parameter in the kernel
%         Lk: truncation parameter
%         H: Real part of the matrix 
%         H1: Imaginary part of the matrix

gH_sum = zeros(size(H));

Nk = 200*Lk;
ks = linspace(-Lk,Lk,Nk);
dk = ks(2)-ks(1);

if (beta <= 0)
   fks = 1.0./(1 - 1i*ks)./(1 + 1i*ks);
   fks = fks/pi;  
end

if (beta > 0 && beta <= 1)
    fks = 1.0./(1 - 1i*ks)./exp((ks.^2+1).^(beta/2) .* exp(1i*beta*atan(ks)));
    fks = fks / (2*pi*exp(-2^(beta)));
end

for ik = 1 : Nk
    gH_sum = gH_sum + fks(ik) * expm(-1i*x*(H*ks(ik)+H1)) * dk;
end

gH = expm(-x*(H+1i*H1));

err = norm(gH-gH_sum);



end

