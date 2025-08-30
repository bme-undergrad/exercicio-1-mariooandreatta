function t = exercicio1(func, a, b)

% nao alterar: inicio 
es = 1;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

iter = 0;
ea = 100;
c = b; % Inicializa 'c' para o calculo do erro na primeira iteracao

% O loop principal do Metodo da Falsa Posição
while (ea > es && iter < imax)
    
    c_old = c;

    fa = func(a);
    fb = func(b);
    
    % Evita divisao por zero caso os pontos tenham a mesma altura
    if (fb - fa) == 0
        break;
    end

    % A formula e a mesma do Metodo da Secante
    c = b - fb * (b - a) / (fb - fa);
    
    % Calcula o erro relativo aproximado
    if c ~= 0
        ea = abs((c - c_old) / c) * 100;
    end
    
    fc = func(c);

    % Atualiza o intervalo [a, b] garantindo que a raiz permaneça
    % dentro do intervalo, o que evita a divergencia.
    if fa * fc < 0
        b = c;
    else
        a = c;
    end
    
    iter = iter + 1;
end

t = c;

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
