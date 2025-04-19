gen_part;
llamadaev();
yp1=yp;
h=L/(N+1);

for j=1:M
    % Velocidades
    [vp]=evop(Wy(:,j),Wry(:,j),Wiy(:,j),h,yi,yp1);
    for i=1:length(yp1)
        if yp1(i)>(yi+L-3)
            vp1(i)=0;
            yp1(i)=yi+L-1;
        end
    end
    % Posiciones
    yp1=yp1+vp*k;
    % Representación de la función de onda y las particulas evolucionado
    plot(y,Wty(:,j))
    hold on
    scatter(yp1,valvertical)
    xlim([-10 (yi+L-5)]);
    ylim([0 0.35]);
    hold off
    A=getframe();
    if j==1
        figure(2)
        scatter(yp1,valvertical)
        xlabel('Position (Å)')
        xlim([-10 10]);
        yticks([]);
        set(gca, 'YColor', 'none');
        saveas(gcf, 'Image 11.jpg')
        figure(3)
        plot(y,Wty(:,j))
        hold on
        plot(y,Wry(:,j))
        plot(y,Wiy(:,j))
        xlabel('Position (Å)')
        xlim([-10 10]);
        ylim([-0.4 0.4]);
        legend('Probability density','Real-part wave-function','Imaginary-part wave-function','Location','best')
        yline(0,'k','LineWidth',1,'HandleVisibility','off')
        saveas(gcf, 'Image 7.jpg')
        hold off
    end
    if j==300
        figure(2)
        scatter(yp1,valvertical)
        xlabel('Position (Å)')
        xlim([5 25]);
        yticks([]);
        set(gca, 'YColor', 'none');
        saveas(gcf, 'Image 12.jpg')
        figure(3)
        plot(y,Wty(:,j))
        hold on
        plot(y,Wry(:,j))
        plot(y,Wiy(:,j))
        xlabel('Position (Å)')
        xlim([5 25]);
        ylim([-0.4 0.4]);
        legend('Probability density','Real-part wave-function','Imaginary-part wave-function','Location','best')
        yline(0,'k','LineWidth',1,'HandleVisibility','off')
        saveas(gcf, 'Image 8.jpg')
        hold off
    end
    if j==301
        figure(2)
        scatter(yp1,valvertical)
        xlabel('Position (Å)')
        xlim([5 25]);
        yticks([]);
        set(gca, 'YColor', 'none');
        saveas(gcf, 'Image 13.jpg')
        figure(3)
        plot(y,Wty(:,j))
        hold on
        plot(y,Wry(:,j))
        plot(y,Wiy(:,j))
        xlabel('Position (Å)')
        xlim([5 25]);
        ylim([-0.4 0.4]);
        legend('Probability density','Real-part wave-function','Imaginary-part wave-function','Location','best')
        yline(0,'k','LineWidth',1,'HandleVisibility','off')
        saveas(gcf, 'Image 9.jpg')
        hold off
    end
    if j==600
        figure(2)
        scatter(yp1,valvertical)
        xlabel('Position (Å)')
        xlim([-10 10]);
        yticks([]);
        set(gca, 'YColor', 'none');
        saveas(gcf, 'Image 14.jpg')
        figure(3)
        plot(y,Wty(:,j))
        hold on
        plot(y,Wry(:,j))
        plot(y,Wiy(:,j))
        xlabel('Position (Å)')
        xlim([-10 10]);
        ylim([-0.4 0.4]);
        legend('Probability density','Real-part wave-function','Imaginary-part wave-function','Location','best')
        yline(0,'k','LineWidth',1,'HandleVisibility','off')
        saveas(gcf, 'Image 10.jpg')
        hold off
        break
    end
end

terminar=false;
figure(1)
for j=1:M
    % Velocidades
    [vp]=evop(Uy(:,j),Ury(:,j),Uiy(:,j),h,yi,yp);
    % Si los puntos no se salen del intervalo de solución termina
    for i=1:length(yp)
        if yp(i)>(yi+L-3)
            terminar=true;
            break
        end
    end
    if terminar==true
        break
    end
    % Posiciones
    yp=yp+vp*k;
    % Representación de la función de onda y las particulas evolucionado
    plot(y,Uty(:,j))
    hold on
    scatter(yp,valvertical)
    xlim([-10 (yi+L-5)]);
    ylim([0 0.35]);
    hold off
    A=getframe();
    if j==1
        figure(2)
        scatter(yp,valvertical)
        xlabel('Position (Å)')
        xlim([-5 5]);
        yticks([]);
        set(gca, 'YColor', 'none');
        saveas(gcf, 'Image 4.jpg')
        figure(3)
        plot(y,Uty(:,j))
        hold on
        plot(y,Ury(:,j))
        plot(y,Uiy(:,j))
        xlabel('Position (Å)')
        xlim([-5 5]);
        ylim([-0.4 0.4]);
        legend('Probability density','Real-part wave-function','Imaginary-part wave-function','Location','best')
        yline(0,'k','LineWidth',1,'HandleVisibility','off')
        saveas(gcf, 'Image 1.jpg')
        hold off
    end
    if j==75
        figure(2)
        scatter(yp,valvertical)
        xlabel('Position (Å)')
        xlim([-1.25 8.75]);
        yticks([]);
        set(gca, 'YColor', 'none');
        saveas(gcf, 'Image 5.jpg')
                figure(3)
        plot(y,Uty(:,j))
        hold on
        plot(y,Ury(:,j))
        plot(y,Uiy(:,j))
        xlabel('Position (Å)')
        xlim([-1.25 8.75]);
        ylim([-0.4 0.4]);
        legend('Probability density','Real-part wave-function','Imaginary-part wave-function','Location','best')
        yline(0,'k','LineWidth',1,'HandleVisibility','off')
        saveas(gcf, 'Image 2.jpg')
        hold off
    end
    if j==150
        figure(2)
        scatter(yp,valvertical)
        xlabel('Position (Å)')
        xlim([2.5 12.5]);
        yticks([]);
        set(gca, 'YColor', 'none');
        saveas(gcf, 'Image 6.jpg')
        figure(3)
        plot(y,Uty(:,j))
        hold on
        plot(y,Ury(:,j))
        plot(y,Uiy(:,j))
        xlabel('Position (Å)')
        xlim([2.5 12.5]);
        ylim([-0.4 0.4]);
        legend('Probability density','Real-part wave-function','Imaginary-part wave-function','Location','best')
        yline(0,'k','LineWidth',1,'HandleVisibility','off')
        saveas(gcf, 'Image 3.jpg')
        hold off
        break
    end
end
