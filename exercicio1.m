function t = exercicio1(func, x0)
% nao alterar: inicio
es = 1;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%
% digite seu codigo aqui

% Método da Secante
iter = 0;
x_prev = x0;
x_curr = x0 * 1.01; % Segundo ponto inicial
ea = 100;

while (ea > es && iter < imax)
    iter = iter + 1;
    
    % Avaliar a função nos pontos atuais
    f_prev = func(x_prev);
    f_curr = func(x_curr);
    
    % Evitar divisão por zero
    if abs(f_curr - f_prev) < 1e-12
        break;
    end
    
    % Calcular nova estimativa
    x_new = x_curr - f_curr * (x_curr - x_prev) / (f_curr - f_prev);
    
    % Não permitir valores negativos
    if x_new < 0
        x_new = 1e-10;
    end
    
    % Calcular erro relativo percentual
    if abs(x_new) > 1e-12
        ea = abs((x_new - x_curr) / x_new) * 100;
    else
        ea = 0;
    end
    
    % Atualizar pontos para próxima iteração
    x_prev = x_curr;
    x_curr = x_new;
    
    % Critério de parada adicional
    if abs(func(x_curr)) < 1e-10
        break;
    end
end

t = x_curr;

%%%%%%%%%%%%%%%%%%%%%%%%%%
endfunction
