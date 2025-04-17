function [vp]=evop(U,Ur,Ui,h,xi,xp)
%% Evolución partículas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrada
% * U = función solución de la evolución
% * Ur = parte real de la función solución
% * Ui = parte imaginaria de la función solución
% * h = discretización del espacio usado para la solución
% * posi = valor inicial del espacio de la solución
% * posp = posiciones de las partículas generadas de forma gausiana
%%%%%%%%%%%%%%%%%%%%%%%%
% Salida
% * vp = velocidades de las partículas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hb=1; % valor hbarra
m=1;  % valor masa
x1=floor(xp/h)*h;           % primer punto de la interpolación
k1=1000+int64((x1-xi)/h+1);      % posición de ese punto en el vector solución (-xi +1 porque xi es negativo y los indices empiezan en 1)
k2=k1+1;                    % posición del segundo punto de la interpolación
Up=zeros(length(k1),1);
vp=zeros(length(k1),1);
for j=1:length(k1)
    Up(j)=U(k1(j))+(xp(j)-x1(j))*(U(k2(j))-U(k1(j)))/h;    %interpolación
    if Up(j)==U(k1(j))      % Para el caso en el que la interpolación sea igual al valor del punto anterior
        k1(j)=k1(j)-1;
        h2=2*h;
        % Velocidad de la partícula 
        vp(j)=hb/m*(real(Up(j))*(Ui(k2(j))-Ui(k1(j)))/h2-imag(Up(j))*(Ur(k2(j))-Ur(k2(j)))/h2)/(conj(Up(j))*Up(j)); % velocidad de la partícula
    else
        vp(j)=hb/m*(real(Up(j))*(Ui(k2(j))-Ui(k1(j)))/h-imag(Up(j))*(Ur(k2(j))-Ur(k1(j)))/h)/(conj(Up(j))*Up(j));   % velocidad de la partícula
    end
end