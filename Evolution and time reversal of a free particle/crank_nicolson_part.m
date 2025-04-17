function [U]=crank_nicolson_part(U,h,k,alfa,froni,frond,N,M)
%% Método Crank-Nicolson para resolver ec del calor
% Con condiciones de libre intercambio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrada
% * L = longitud del intervalo.
% * uini = condición inicial u(x,0).
% * alfa = constante de la ecuación.
% * froni = u(0,t).
% * frond = u(xfinal,t).
% * N = número de discretación (pasos en x).
% * M = número de iteraciones en tiempo (pasos en t).
% * T = intervalo de tiempo.
%%%%%%%%%%%%%%%%%%%%%%%%
% Salida
% * x = vector de puntos en x.
% * t = vector de puntos en t.
% * U = ecuación solución.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  nu =alfa*k/h^2;
  coef1 =2+2*nu;
  coef2 =2-2*nu;
  b=zeros(1,N);
  P=ones(1,N)*coef1;
  Q=ones(1,N-1)*(-nu);
  R=Q;
  %% Condiciones de libre intercambio
  librinter=ones(N+2,1);
  for j=1:(10/h)
        librinter(j)=1-exp(-j^2/(2*(1/h)^2));
        librinter(N+2-j+1)=1-exp(-j^2/(2*(1/h)^2));
  end
  %%
  for m=2:M+1
      U(1,m)  = froni((m-1)*k);
      U(N+2,m)= frond((m-1)*k);
      U(1,m)  =U(2,m-1);
      U(N+2,m)=U(N+1,m-1);
      for j=1:N
          b(j)= nu*U(j,m-1)+coef2*U(j+1,m-1)+nu*U(j+2,m-1);
      end
      b(1)=b(1)+nu*U(1,m);
      b(N)=b(N)+nu*U(N+2,m);
      U(2:N+1,m)=tridiagonal(P,Q,R,b);
      U=U.*librinter;
  end