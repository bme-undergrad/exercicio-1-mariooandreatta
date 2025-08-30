function t = exercicio1(func,d_func,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

t_roots = zeros(imax,1);
t_roots(1) = x0; 

for ii = 1:length(t_roots)-1
if ii ~= 1
erro(ii) = abs((t_roots(ii)-t_roots(ii-1))/t_roots(ii))
if erro(ii) < es
break
endif
endif
t_roots(ii+1) = t_roots(ii) - func(t_roots(ii))/func_d(t_roots(ii));
endfor
t = t_roots(ii);

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
