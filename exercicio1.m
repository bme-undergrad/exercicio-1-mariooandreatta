function t = exercicio1(func, x0, x1)
% EXERCICIO1 Calcula o tempo para atingir velocidade específica no biorreator
%   t = exercicio1(func, x0, x1) encontra a raiz usando método da secante
%
%   Input:
%   func - função anônima f(t) = v(t) - v_desejada
%   x0   - primeiro chute inicial para o tempo
%   x1   - segundo chute inicial para o tempo

% nao alterar: inicio
es = 1;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%
% digite seu codigo aqui

% Verificar se x1 foi fornecido, senão usar valor padrão
if nargin < 3
    x1 = x0 * 1.01; % Segundo chute padrão
end

% Inicialização do método da secante
iter = 0;
x_prev = x0;
x_curr = x1;
ea = 100; % Erro relativo inicial (100%)

% Loop principal do método da secante
while (ea > es && iter < imax)
    iter = iter + 1;
    
    % Avaliar a função nos pontos anteriores
    f_prev = func(x_prev);
    f_curr = func(x_curr);
    
    % Verificar divisão por zero
    if abs(f_curr - f_prev) < 1e-12
        % Se os valores forem muito próximos, usar método alternativo
        x_new = (x_prev + x_curr) / 2;
    else
        % Calcular nova estimativa usando fórmula da secante
        x_new = x_curr - f_curr * (x_curr - x_prev) / (f_curr - f_prev);
    end
    
    % Garantir que não temos valores negativos (tempo não pode ser negativo)
    if x_new < 0
        x_new = 1e-6; % Valor positivo muito pequeno
    end
    
    % Calcular erro relativo aproximado em porcentagem
    if abs(x_new) > 1e-12
        ea = abs((x_new - x_curr) / x_new) * 100;
    else
        ea = 0;
    end
    
    % Preparar para próxima iteração
    x_prev = x_curr;
    x_curr = x_new;
    
    % Critério de parada adicional: função muito próxima de zero
    if abs(func(x_curr)) < 1e-8
        break;
    end
end

t = x_curr;

%%%%%%%%%%%%%%%%%%%%%%%%%%
endfunction
