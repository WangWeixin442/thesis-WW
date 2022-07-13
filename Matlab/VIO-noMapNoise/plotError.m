clear;
close all;

load('data-largeInitErr.mat');
t = 0:1/200:40;

hAxes = 0.8;
wAxes = 3.0;
dh = 0.15;

bm = 0.35;
lm = 0.4;
yllp = -0.23;

f = figure;
set(f,'Units','Inches','Position',[13,5,3.5,3.1]);

ax1 = axes('Units','inches','Position',[lm,bm,wAxes,hAxes]);
hold on;
color = get(ax1,'ColorOrder');
set(ax1,'FontName','Times','FontSize',8);
plot(t,x_err_MEKF.p,'Color',color(1,:),'LineStyle','-');
plot(t,x_err_MFG.p,'Color',color(2,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
yl = ylabel('pos err (m)','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax2 = axes('Units','inches','Position',[lm,bm+hAxes+dh,wAxes,hAxes]);
hold on;
set(ax2,'FontName','Times','FontSize',8);
plot(t,x_err_MEKF.v,'Color',color(1,:),'LineStyle','-');
plot(t,x_err_MFG.v,'Color',color(2,:),'LineStyle','-');
set(ax2,'XTick',[]);
yl = ylabel('vel err (m/s)','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax3 = axes('Units','inches','Position',[lm,bm+2*hAxes+2*dh,wAxes,hAxes]);
hold on;
set(ax3,'FontName','Times','FontSize',8);
plot(t,x_err_MEKF.R*180/pi,'Color',color(1,:),'LineStyle','-');
plot(t,x_err_MFG.R*180/pi,'Color',color(2,:),'LineStyle','-');
set(ax3,'XTick',[]);
ylim([0,180]);
yticks([0,60,120,180])
legend('EKF','MFG','Location','southeast');
yl = ylabel('att err (deg)','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

print('error','-depsc','-painters');
