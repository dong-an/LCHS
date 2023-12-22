
% Plot the real and imaginary parts of the kernels

Nk = 20000;
Lk = 200;
ks = linspace(-Lk,Lk,Nk);
% ks = linspace(-Lk,-Lk+50,Nk);
dk = ks(2)-ks(1);
x = 1.0;

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.1));
% fks = fks/1.578263816808467; 

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.5));
% fks = fks/1.527558983747461;

fks = 1.0./exp((1+1i*ks).^(0.5));
fks = fks/1.527558983747461;

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.9));
% fks = fks/0.972204683583877;

% fks = 1.0./(1 - 1i*ks)./exp((1+1i*ks).^(0.99));
% fks = fks/0.862165592160031; 

plot(ks,real(fks),'LineWidth',2)
hold on
plot(ks,imag(fks),'LineWidth',2)
set(gca,'FontSize',20)
xlabel('k')
legend('Real part', 'Imaginary part')
axis([-30,30,-0.15,0.4])

title('$\beta = 0.99$', 'Interpreter','latex')
% title('$\beta = 0.5$', 'Interpreter','latex')
% title('$\beta = 0.9$', 'Interpreter','latex')


