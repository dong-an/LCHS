function [H,H1] = func_gen_mat(seed)
% Randomly generate a matrix

rng(seed)

n = 8;
H = randn(n)+1i*randn(n);
H = 0.5*(H+H');
ev_H = eig(H);
ev_a = 0.0;
ev_b = 1.0;
H = ev_a*eye(n) + (H-min(ev_H)*eye(n))*(ev_b-ev_a)/(max(ev_H)-min(ev_H));

H1 = randn(n) + 1i * randn(n);
H1 = (H1 - H1')/(2i) * 1;
H1 = H1/norm(H1);


end

