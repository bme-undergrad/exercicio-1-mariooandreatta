function t = exercicio1(func, x0)
% EXERCICIO1 Calcula o tempo para atingir velocidade específica no biorreator
%   t = exercicio1(func, x0) encontra a raiz da função usando método da secante
%
%   Input:
%   func - função anônima f(t) = v(t) - v_desejada
%   x0   - chute inicial para o tempo
%
%   Output:
%   t    - tempo necessário para atingir a velocidade desejada

% nao alterar: inicio
es = 1;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%
% digite seu codigo aqui

% Inicialização do método da secante
iter = 0;
x_prev = x0;
x_curr = x0 * 1.01; % Pequena perturbação para iniciar o método
ea = 100; % Erro relativo inicial (100%)

% Loop principal do método da secante
while (ea > es && iter < imax)
    iter = iter + 1;
    
    % Avaliar a função nos pontos anteriores
    f_prev = func(x_prev);
    f_curr = func(x_curr);
    
    % Verificar divisão por zero
    if abs(f_curr - f_prev) < 1e-10
        break;
    end
    
    % Calcular nova estimativa usando fórmula da secante
    x_new = x_curr - f_curr * (x_curr - x_prev) / (f_curr - f_prev);
    
    % Calcular erro relativo aproximado em porcentagem
    if abs(x_new) > 1e-10
        ea = abs((x_new - x_curr) / x_new) * 100;
    else
        ea = 0;
    end
    
    % Preparar para próxima iteração
    x_prev = x_curr;
    x_curr = x_new;
end

t = x_curr;

%%%%%%%%%%%%%%%%%%%%%%%%%%
endfunction
