
% Plot the norms of different kernels

Nk = 200000;
Lk = 200;
ks = linspace(-Lk,Lk,Nk);
% ks = linspace(-Lk,-Lk+50,Nk);
dk = ks(2)-ks(1);
x = 1.0;

fks = 1.0./(1 - 1i*ks)./(1 + 1i*ks);
fks = fks/pi; 
norm_0 = abs(fks); 

fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.1));
fks = fks/1.578263816808467; 
norm_1 = abs(fks); 

fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.5));
fks = fks/1.527558983747461;
norm_2 = abs(fks); 

fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.9));
fks = fks/0.972204683583877;
norm_3 = abs(fks); 

fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.99));
fks = fks/0.862165592160031; 
norm_4 = abs(fks); 

semilogy(ks,norm_0,'k-.','LineWidth',2)
hold on
semilogy(ks,norm_1,'m-','LineWidth',2)
semilogy(ks,norm_2,'c-','LineWidth',2)
semilogy(ks,norm_3,'b-','LineWidth',2)
semilogy(ks,norm_4,'r-','LineWidth',2)
set(gca,'FontSize',20)
xlabel('k')
legend('$1/(\pi(1+k^2))$', '$\beta = 0.1$', '$\beta = 0.5$', '$\beta = 0.9$', '$\beta = 0.99$',...
    'Interpreter','latex')
axis([-200,200,1e-10,100])





