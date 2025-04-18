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
a=0;
b=0;
c=0;
% Evolución de las partículas generadas según la función de onda calculada
for l=1:length(yp)
    if yp(l)<=yi
        yp(l)=yi;
    elseif yp(l)>=yi+L
        yp(l)=yi+L;
    end
end
figure(1)
for j=1:M
    % Velocidades
    [vp]=evop(Uy(:,j),Ury(:,j),Uiy(:,j),h,yi,yp);
    % Posiciones
    yp=yp+vp*k;
    for l=1:length(yp)
        if yp(l)<=yi
            yp(l)=yi;
        elseif yp(l)>=yi+L
            yp(l)=yi+L;
        end
    end
    % Dispersiones
    a(j)=std(yp);
    b(j)=std(vp);
    c(j)=a(j)*b(j);
    % Representación de la función de onda y las particulas evolucionado
    plot(y,Uty(:,j))
    hold on
    scatter(yp,valvertical)
    xlim([-4 4]);
    ylim([0 0.35]);
    hold off
    A=getframe();   
end
figure(2)
hold on
title("Dispersion of the particle's position (caged)")
xlabel("Time (a.u.t.)")
ylabel("Standard deviation (Å)")
plot(t(1:length(a)),a)
saveas(gcf, 'Dispersion of the particle`s position (caged).jpg')
hold off
figure(3)
hold on
title("Dispersion of the particle's velocity (caged)")
plot(t(1:length(a)),b)
xlabel("Time (a.u.t.)")
ylabel("Standard deviation (Å/a.u.t.)")
saveas(gcf, 'Dispersion of the particle`s velocity (caged).jpg')
hold off
figure(4)
hold on
title("Uncertainty principle (caged)")
plot(t(1:length(a)),c)
xlabel("Time (a.u.t.)")
ylabel("Uncertainty (ħ units)")
saveas(gcf, 'Uncertainty principle (caged).jpg')
hold off
movie(A)