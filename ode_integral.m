%% Test different kernels related to the LCHS equation

Nk = 20000;                   % Number of quadrature nodes
Lk = 100;                     % Integral truncation parameter
ks = linspace(-Lk,Lk,Nk);
dk = ks(2)-ks(1);
x = 1.0;

%% Estimate the normalization factor
if (0)
%fks = 1.0/pi * (1 ./ (1 + ks.^2));

% p = 3;
% fks = 1.0./(1 - 1i*ks)./((1 + 1i*ks).^p); 

% fks = 1.0./(1 - 1i*ks)./(1 + 1i*ks).*exp(-(abs(ks).^2));

% fks = 1.0./(1 - 1i*ks)./exp((log(1+1i*ks)).^2);
% gx = 3.886169827872601; 

% fks = 1.0./(1 - 1i*ks)./exp((log(1+1i*ks)).^3);
% gx = 4.503488931215398; 

% fks = 1.0./(1 - 1i*ks)./exp(sqrt(1+1i*ks));
% gx = 1.527547511136033; 

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.5));
% gx = 1.527558983747461;

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.2));
% gx = 1.832641063254574;

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.1));
% gx = 1.578263816808467; 

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.9));
% gx = 0.972204683583877; 

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.99));
% gx = 0.862165592160031; 

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(1));
% gx = 0.850471850645070;

% fks = 1.0./(1 - 1i*ks)./ (exp(ks) + exp(-ks) + exp(1+1i*ks));
% gx = 0.585061825811915; 

% beta = 0.9; 
% fks = 1.0./(1 - 1i*ks)./exp((ks.^2+1).^(beta/2) .* exp(1i*beta*atan(ks)));
% gx = 0.972204683583877;

% fks = 1.0./exp((1+1i*ks).^(0.9));

gx_sum = sum(fks) * dk;
gx = 2.22144138574253; 

fprintf('gx_sum  =%15.5e\n', gx_sum);
fprintf('err =%15.5e\n', abs(gx-gx_sum));
end


%%
if(1)
rng('default')
n = 8;
H = randn(n)+1i*randn(n);
H = 0.5*(H+H');
ev_H = eig(H);
ev_a = 0.0;
ev_b = 1.0;
H = ev_a*eye(n) + (H-min(ev_H)*eye(n))*(ev_b-ev_a)/(max(ev_H)-min(ev_H));

% H1 = randn(n)+1i*randn(n);
% H1 = 0.5*(H1+H1');
% ev_H1 = eig(H1);
% ev_a = 0.5;
% ev_b = 1.0;
% H1 = ev_a*eye(n) + (H1-min(ev_H1)*eye(n))*(ev_b-ev_a)/(max(ev_H1)-min(ev_H1));

H1 = randn(n) + 1i * randn(n);
H1 = (H1 - H1')/(2i) * 1;

gH_sum = zeros(size(H));

% fks = 1.0/pi * (1 ./ (1 + ks.^2));

% p = 5;
% fks = 2^(p-1)/pi./(1 - 1i*ks)./((1 + 1i*ks).^p);

% fks = 1.0./(1 - 1i*ks)./exp((log(1+1i*ks)).^2);
% fks = fks/3.886169827872601; 

% fks = 1.0./(1 - 1i*ks)./exp((log(1+1i*ks)).^3);
% fks = fks/4.503488931215398; 

% fks = 1.0./(1 - 1i*ks)./exp(sqrt(1+1i*ks));
% fks = fks/1.527547493681954;

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.9));
% fks = fks/0.972204683583877; 

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.1));
% gx = 1.578263816808467; 

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks));
% fks = fks/0.850471850645070; 

% fks = 1.0./(1 - 1i*ks)./ (exp(ks) + exp(-ks) + exp(1+1i*ks));
% fks = fks/0.585061825811915; 

beta = 0.9; 
fks = 1.0./(1 - 1i*ks)./exp((ks.^2+1).^(beta/2) .* exp(1i*beta*atan(ks)));
gx_norm = sum(fks) * dk;
fks = fks/gx_norm;

for ik = 1 : Nk
    gH_sum = gH_sum + fks(ik) * expm(-1i*(H*ks(ik)+H1)) * dk;
end

gH = expm(-(H+1i*H1));
fprintf('||gH||  = %g\n', norm(gH));
fprintf('||err|| = %g\n', norm(gH-gH_sum));


% gH_sum = zeros(size(H));
% fks = 1.0/(2*pi) * (1 ./ (1 + 1i*ks));
% for ik = 1 : Nk
%     gH_sum = gH_sum + fks(ik) * expm(-1i*(H*ks(ik)+H1)) * dk;
% end
% norm(gH_sum)
end
