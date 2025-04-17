%% Generación de distribución gausiana
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parámetros
% * n = numero relacionado con la cantidad de numeros aleatorios y las dimensiones de vectores y matrices (n^2)
% * m = cantidad de veces que se suman los números aleatorios.
%%%%%%%%%%%%%%%%%%%%%%%%
% Salida
% * yp = vector de posiciones de las partículas en el eje y.
% * valvertical = vector de "altura" de las partículas para poder apreciarlas mejor en la simulación.
%%%%%%%%%%%%%%%%%%%%%%%%
% Información
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=1000;
m=50;
G=randogaus(n,m);
% Generación de partículas distribuidas de forma gausiana
numpart=1000;
yp=zeros(numpart,1);
valvertical=zeros(1,numpart);
for j=1:numpart
    yp(j)=G(round(n^2*rand));
    valvertical(j)=0.17+rand/6;
end