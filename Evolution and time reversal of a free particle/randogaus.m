function [G]=randogaus(n,m)
%% Generador rand gausiano
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrada
% m: cantidad de veces que se suman los números aleatorios
% n: numero relacionado con la cantidad de numeros aleatorios y las dimensiones de vectores y matrices (n^2)
%%%%%%%%%%%%%%%%%%%%%%%%
% Salida
% G: matríz de probabilidades gausianas
%%%%%%%%%%%%%%%%%%%%%%%%
% Información
% -m/2 es para centrar en 0 y *sqrt(12/m) es para que la desviación estándar coincida con el 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Generador rand de forma gausiana con vector
G=zeros(n^2,1);
for k=1:m
    for j=1:n^2
    G(j)=G(j)+rand;
    end
end
G=(G-m/2)*sqrt(12/m);
return