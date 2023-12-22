function [y] = func_ilchs(x,beta)
%  Compute the Fourier transform of f(k)/(1-ik)

Nk = 100000;
Lk = 1000;
ks = linspace(-Lk,Lk,Nk);
dk = ks(2)-ks(1);

if (beta <= 0)
   fks = 1.0./(1 - 1i*ks)./(1 + 1i*ks) .* exp(-1i*x*ks);
   fks = fks/pi;  
end

if (beta > 0 && beta < 1)
    fks = 1.0./(1 - 1i*ks)./exp((ks.^2+1).^(beta/2) .* exp(1i*beta*atan(ks)));
    gx_sum = sum(fks) * dk;
    fks = fks .* exp(-1i*x*ks);
    fks = fks/gx_sum;
end

y = sum(fks) * dk; 



end

