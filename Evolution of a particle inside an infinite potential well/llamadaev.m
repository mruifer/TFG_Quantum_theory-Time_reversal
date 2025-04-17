%% LLamada evolución
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parámetros
% * k_ = velocidad inicial en el eje _
% * L = longitud del intervalo.
% * xi = primer punto del eje
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
% * U = ecuación solución de la evolución.
%%%%%%%%%%%%%%%%%%%%%%%%
% Información
% * Velocidad en el eje y: Energía=10 eV -> p0y=raiz(2mE)=5.14
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hb=1;
m=1;
ky=3.14/hb;
alfa=1i*hb/(2*m);
% Parámetros espaciales
yi=-4;
L=8;
%N=99999;
N=2^18;
h=L/(N+1);
y=yi:h:yi+L;
% Parámetros temporales
T=20;
M=1999;
k=T/M;
t=0:k:T;
% Vectores donde se almacenarán las soluciones
Uy=zeros(N+2,M+1);
% Condiciones de frontera
froni=@(t)(0);
frond=@(t)(0);
Uy(1,1)=froni(0);
Uy(N+2,1)=frond(0);
% Funciones en el instante inicial (velocidad inicial en el eje y)
uiniy=@(y)1/sqrt(2*pi)*(exp(1i*ky*y).*exp(-y.^2/2));
%uiniy=@(y)1/sqrt(2*pi).*exp(-y.^2/2);
Uy(2:N+1,1)=uiniy(y(2:N+1));
% Resolvemos la ecuación
[Uy]=crank_nicolson_part(Uy,h,k,alfa,froni,frond,N,M);
Uy=[zeros(1000,M+1);Uy;zeros(1000,M+1)];
y=yi-1000*h:h:yi+L+1000*h;
% Soluciones
Ury=real(Uy);
Uiy=imag(Uy);
Uty=abs(Uy).^2;
