
% Plot the truncation order K to reach a given accuracy with respect to
% beta

load('result_err_1e-2_seed_1_for_plot_new')

semilogy(beta_set,K_set,'bo-','LineWidth',2)
hold on

set(gca,'Fontsize',20)
xlabel('\beta')
ylabel('K')

% Precomputed result for Cauchy: seed = 1, err = 1e-2, K = 63.7
beta_subset = -0.1:0.2:1.1; 
semilogy(beta_subset,63.7*ones(size(beta_subset)),'bo--')


load('result_err_1e-3_seed_1_for_plot_new')

semilogy(beta_set,K_set,'rx-','LineWidth',2)

% Precomputed result for Cauchy: seed = 1, Cauchy, err = 1e-3, K = 637
semilogy(beta_subset,637*ones(size(beta_subset)),'rx--')

f = get(gca,'Children');
legend([f(4),f(2)], 'err = 0.01', 'err = 0.001','Interpreter','latex')
axis([0.19,1,5,13000])



