
% Plot the Fourier transform of f(k)/(1-ik) for different kernels

Nk = 501;
Lk = 5;
xs = linspace(-Lk,Lk,Nk);

f0 = zeros(1,Nk);
for ite = 1:1:Nk
   xc = xs(ite); 
   f0(ite) = func_ilchs(xc,0); 
end

f1 = zeros(1,Nk);
load('beta_0_1.mat')  % Using pre-computed data for beta = 0.1 to save time
% for ite = 1:1:Nk
%    xc = xs(ite); 
%    f1(ite) = func_ilchs(xc,0.1); 
%    fprintf('%d completed\n',ite)
% end

f2 = zeros(1,Nk);
for ite = 1:1:Nk
   xc = xs(ite); 
   f2(ite) = func_ilchs(xc,0.3); 
end

f3 = zeros(1,Nk);
for ite = 1:1:Nk
   xc = xs(ite); 
   f3(ite) = func_ilchs(xc,0.5); 
end

f4 = zeros(1,Nk);
for ite = 1:1:Nk
   xc = xs(ite); 
   f4(ite) = func_ilchs(xc,0.7); 
end

f5 = zeros(1,Nk);
for ite = 1:1:Nk
   xc = xs(ite); 
   f5(ite) = func_ilchs(xc,0.9); 
end

f6 = zeros(1,Nk);
for ite = 1:1:Nk
   xc = xs(ite); 
   f6(ite) = func_ilchs(xc,0.99); 
end


plot(xs,real(f0),'k-.','LineWidth',2)
hold on
plot(xs,real(f1),'LineWidth',2)
plot(xs,real(f2),'LineWidth',2)
plot(xs,real(f3),'LineWidth',2)
plot(xs,real(f4),'LineWidth',2)
plot(xs,real(f5),'LineWidth',2)
plot(xs,real(f6),'LineWidth',2)

set(gca,'FontSize',20)
xlabel('x')
legend('$1/(\pi(1+k^2))$', '$\beta = 0.1$', '$\beta = 0.3$', ...
    '$\beta = 0.5$', '$\beta = 0.7$', '$\beta = 0.9$',...
    '$\beta = 0.99$','Interpreter','latex')
title('Fourier transform')
axis([-2.5,2.5,0,3])


