clear;
close all;

load('errors.mat');
load('data.mat');

hAxes = 0.8;
wAxes = 3.0;
dh = 0.15;

bm = 0.35;
lm = 0.4;
yllp = -0.23;

for i = 1:5
    f = figure('Units','inches','Position',[13,3,3.5,2.2]);

    t = data{i}.x_true.t;
    t = t-t(1);

    ax1 = axes('Units','inches','Position',[lm,bm,wAxes,hAxes]);
    hold on;
    color = get(ax1,'ColorOrder');
    set(ax1,'FontName','Times','FontSize',8);
    plot(t,errors{i}.nomap.pEKF,'Color',color(1,:),'LineStyle','-');
    plot(t,errors{i}.nomap.pMFG,'Color',color(2,:),'LineStyle','-');
    plot(t,errors{i}.map.pEKF,'Color',color(3,:),'LineStyle','-');
    plot(t,errors{i}.map.pMFG,'Color',color(4,:),'LineStyle','-');
    xlim([t(1),t(end)]);
    xlabel('time (second)','FontName','Times');
    yl = ylabel('pos err (m)','Units','inches');
    ylp = get(yl,'Position');
    ylp(1) = yllp;
    set(yl,'Position',ylp);
    
    ax2 = axes('Units','inches','Position',[lm,bm+hAxes+dh,wAxes,hAxes]);
    hold on;
    set(ax2,'FontName','Times','FontSize',8);
    plot(t,errors{i}.nomap.REKF*180/pi,'Color',color(1,:),'LineStyle','-');
    plot(t,errors{i}.nomap.RMFG*180/pi,'Color',color(2,:),'LineStyle','-');
    plot(t,errors{i}.map.REKF*180/pi,'Color',color(3,:),'LineStyle','-');
    plot(t,errors{i}.map.RMFG*180/pi,'Color',color(4,:),'LineStyle','-');
    xlim([t(1),t(end)]);
    set(ax2,'XTick',[]);
    yl = ylabel('att err (deg)','Units','inches');
    ylp = get(yl,'Position');
    ylp(1) = yllp;
    set(yl,'Position',ylp);

    print(strcat('VIO-VCU_RVI-error',num2str(i)),'-depsc','-painters');
end

