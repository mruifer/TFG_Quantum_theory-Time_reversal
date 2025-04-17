%%% Simulación de partículas libres
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables
% * 
%%%%%%%%%%%%%%%%%%%%%%%%
% Unidades
% * Masa: m_e (masa del electrón = 9.10x10^-31 kg)
% * Distancia: A (Amstrong = 1.0x10^-10 m)
% * hbarra: hb (1 hb = 1.05x10^-34 kg m^2/s)
% * Tiempo: a.u._t (unidades de tiempo = 8.66x10^-17 s)
% * Energía: a.u._e (unidades de energía = 1.21x10^-18 kg m^2/s^2)
%%%%%%%%%%%%%%%%%%%%%%%%
% Información
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Generación de distribución gausiana
gen_part;
%% Solución de la ecuación de onda de partícula libre
llamadaev;
% Evolución de las partículas generadas según la función de onda calculada
yp1=yp;
a=0;
b=0;
c=0;
terminar=false;
figure(1)
for j=1:M+1
    % Velocidades
    [vp]=evop(Uy(:,j),Ury(:,j),Uiy(:,j),h,yi,yp1);
    % Si los puntos no se salen del intervalo de solución termina
    for i=1:length(yp1)
        if yp1(i)>(yi+L-5)
            terminar=true;
            break
        end
    end
    if terminar==true
        break
    end
    % Dispersión total
    a(j)=std(yp1);
    b(j)=std(vp);
    c(j)=a(j)*b(j);
    % Posiciones
    yp1=yp1+vp*k;
    % Representación de la función de onda y las particulas evolucionado
    plot(y,Uty(:,j))
    hold on
    scatter(yp,valvertical)
    xlim([-10 (yi+L-5)]);
    ylim([0 0.35]);
    hold off
    A=getframe();
end
movie(A)

%% Partículas que sufren inversión temporal
d=0;
e=0;
f=0;
figure(2)
for j=1:M
    % Velocidades
    [vp]=evop(Wy(:,j),Wry(:,j),Wiy(:,j),h,yi,yp);
    for i=1:length(yp)
        if yp(i)>(yi+L-3)
            vp(i)=0;
            yp(i)=yi+L-1;
        end
    end
    % Dispersión total
    d(j)=std(yp);
    e(j)=std(vp);
    f(j)=d(j)*e(j);
    % Posiciones
    yp=yp+vp*k;
    % Representación de la función de onda y las particulas evolucionado
    plot(y,Wty(:,j))
    hold on
    scatter(yp,valvertical)
    xlim([-10 (yi+L-5)]);
    ylim([0 0.35]);
    hold off
    A=getframe();
end
movie(A)

figure(2)
hold on
title("Standard deviation of the particles' positions")
xlabel("Time (a.u.t.)")
ylabel("Standard deviation (Å)")
plot(t(1:length(a)),a)
fplot(@(x)x)
legend("Simulation","y=x")
grid on
xlim([0 6])
saveas(gcf, 'Imagen15.jpg')
hold off
figure(3)
hold on
title("Standard deviation of the particles' velocities")
plot(t(1:length(a)),b)
xlabel("Time (a.u.t.)")
ylabel("Standard deviation (Å/a.u.t.)")
fplot(@(x)1)
xlim([0 6])
legend("Simulation","y=1")
grid on
saveas(gcf, 'Imagen16.jpg')
hold off
figure(4)
hold on
title("Uncertainty value of the particles")
plot(t(1:length(a)),c)
xlabel("Time (a.u.t.)")
ylabel("Uncertainty (ħ units)")
fplot(@(x)x)
legend("Simulation","y=x")
xlim([0 6])
grid on
saveas(gcf, 'Imagen17.jpg')
hold off
figure(5)
hold on
title("Standard deviation of the particles' positions for the time revesal")
xlabel("Time (a.u.t.)")
ylabel("Standard deviation (Å)")
grid on
plot(t(1:length(d)),d)
saveas(gcf, 'Imagen18.jpg')
hold off
figure(6)
hold on
title("Standard deviation of the particles' velocities for the time revesal")
plot(t(1:length(d)),e)
xlabel("Time (a.u.t.)")
ylabel("Standard deviation (Å/a.u.t.)")
grid on
saveas(gcf, 'Imagen19.jpg')
hold off
figure(7)
hold on
title("Uncertainty value of the particles for the time revesal")
plot(t(1:length(d)),f)
xlabel("Time (a.u.t.)")
ylabel("Uncertainty (ħ units)")
grid on
saveas(gcf, 'Imagen20.jpg')
hold off

