
% Find the minimal truncation parameter K to reach the accuracy err_tol
% under different choices of beta

seed = 1; 
err_tol = 1e-3;

beta_set = [0.99:-0.01:0.25];
K_trial = [15:0.5:49.5,50:1:99,100:2:198,200:5:495,500:10:990,1000:20:2000];
% beta_set = [0.99:-0.01:0.5];
% K_trial = [5:0.1:50];

% beta_set = [0.24:-0.01:0.2];
% K_trial = [420:10:990,1000:20:2000];


err_set = zeros(size(beta_set));
K_set = zeros(size(beta_set));

err_all_set = {}; 

[H,H1] = func_gen_mat(seed);

for ite_beta = 1:1:max(size(beta_set))
    err_list = [];
    for ite_k = 1:1:max(size(K_trial))
        Kc = K_trial(ite_k);
        err = func_error_2(1,beta_set(ite_beta),Kc,H,H1); 
        err_list(end+1) = err;
        fprintf('beta = %f, K = %f, err = %f\n', beta_set(ite_beta),Kc,err);
        if (err < err_tol)
            err_all_set{end+1} = err_list;
            break 
        end
    end
    err_set(ite_beta) = err;
    K_set(ite_beta) = Kc; 
    fprintf('beta = %f completed\n', beta_set(ite_beta));
end

