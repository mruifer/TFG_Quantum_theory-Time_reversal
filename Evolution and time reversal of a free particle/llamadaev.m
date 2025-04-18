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
ky=5.14/hb;
alfa=1i*hb/(2*m);
% Parámetros espaciales
yi=-10;
L=80;
N=399999;
h=L/(N+1);
y=yi:h:yi+L;
% Parámetros temporales
T=6;
M=599;
k=T/M;
t=0:k:T;
% Vectores donde se almacenarán las soluciones
Uy=zeros(N+2,M+1);
% Condiciones de frontera
froni=@(t)(0);
frond=@(t)(0);
Uy(1,1)=froni(0);
Uy(N+2,1)=frond(0);
% Función en el instante inicial (velocidad inicial en el eje y)
uiniy=@(y)1/sqrt(2*pi)*(exp(1i*ky*y).*exp(-y.^2/2));
Uy(2:N+1,1)=uiniy(y(2:N+1));
% Resolvemos la ecuación
[Uy]=crank_nicolson_part(Uy,h,k,alfa,froni,frond,N,M);
% Soluciones
Ury=real(Uy);
Uiy=imag(Uy);
Uty=abs(Uy).^2;
% Inversión temporal
instante=300;
Minv=M-instante;
Wy=zeros(N+2,Minv+1);
Wyini=conj(Uy(:,instante));
% Resolvemos la ecuación
[Wy]=crank_nicolson_part(Wyini,h,k,alfa,froni,frond,N,Minv);
Wy=[Uy(:,1:instante),Wy];
% Soluciones
Wry=real(Wy);
Wiy=imag(Wy);
Wty=abs(Wy).^2;