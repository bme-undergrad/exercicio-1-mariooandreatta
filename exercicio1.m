function t = exercicio1(func, x0, x1_ignorado)

% nao alterar: inicio
es = 1;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

iter = 0;
xr = x0;
ea = 100;
delta = 1e-6;

while (ea > es && iter < imax)
    
    xr_old = xr;
    
    perturbation = delta * xr;
    if xr == 0
        perturbation = delta;
    end
    
    fx = func(xr);
    fx_perturbed = func(xr + perturbation);
    
    derivada_aprox = (fx_perturbed - fx) / perturbation;
    
    if derivada_aprox ~= 0
        xr = xr - fx / derivada_aprox;
    else
        break;
    end
    
    iter = iter + 1;
    
    if xr ~= 0
        ea = abs((xr - xr_old) / xr) * 100;
    end
    
end

t = xr;

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
