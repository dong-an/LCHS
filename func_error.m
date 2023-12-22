function [err] = func_error(x,beta,Lk)
%  Randomly generate a matrix and estimate the error of truncating the integral
%  Input: x: evolution time
%         beta: the decay parameter in the kernel
%         Lk: truncation parameter

rng('default')

n = 8;
H = randn(n)+1i*randn(n);
H = 0.5*(H+H');
ev_H = eig(H);
ev_a = 0.0;
ev_b = 1.0;
H = ev_a*eye(n) + (H-min(ev_H)*eye(n))*(ev_b-ev_a)/(max(ev_H)-min(ev_H));

H1 = randn(n) + 1i * randn(n);
H1 = (H1 - H1')/(2i) * 1;

gH_sum = zeros(size(H));

Nk = 1000*Lk;
ks = linspace(-Lk,Lk,Nk);
dk = ks(2)-ks(1);

if (beta <= 0)
   fks = 1.0./(1 - 1i*ks)./(1 + 1i*ks);
   fks = fks/pi;  
end

if (beta > 0 && beta < 1)
    fks = 1.0./(1 - 1i*ks)./exp((ks.^2+1).^(beta/2) .* exp(1i*beta*atan(ks)));
    gx_sum = sum(fks) * dk;
    fks = fks/gx_sum;
end

for ik = 1 : Nk
    gH_sum = gH_sum + fks(ik) * expm(-1i*x*(H*ks(ik)+H1)) * dk;
end

gH = expm(-(H+1i*H1));

err = norm(gH-gH_sum);



end

