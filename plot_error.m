
% Compute and plot the truncation error with respect to the truncation
% parameter under different choices of beta

L = 5:5:100; 
beta = [0,0.1,0.3,0.5,0.7,0.9,0.99];

err = zeros(max(size(beta)), max(size(L)));
 
for ite_b = 1:1:max(size(beta))
for ite = 1:1:max(size(L))
   err(ite_b,ite) = func_error(1,beta(ite_b),L(ite)); 
   fprintf('beta = %f, L = %d completed\n',beta(ite_b),L(ite))
end
end



loglog(L,err(1,:),'k-.','LineWidth',2)
hold on
loglog(L,err(2,:),'o-','LineWidth',2)
loglog(L,err(3,:),'x-','LineWidth',2)
loglog(L,err(4,:),'*-','LineWidth',2)
loglog(L,err(5,:),'^-','LineWidth',2)
loglog(L,err(6,:),'v-','LineWidth',2)
loglog(L,err(7,:),'s-','LineWidth',2)

set(gca,'FontSize',20)
xlabel('K')
ylabel('Truncation errors')
legend('$1/(\pi(1+k^2))$', '$\beta = 0.1$', '$\beta = 0.3$', ...
    '$\beta = 0.5$', '$\beta = 0.7$', '$\beta = 0.9$',...
    '$\beta = 0.99$','Interpreter','latex')







