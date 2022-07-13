clear;
close all;

load('data_filter1.mat');
t = 0:1/200:40;

hAxes = 0.8;
wAxes = 1.7;
dh = 0.15;
dw = 0.3;

bm = 0.35;
lm = 0.4;
yllp = -0.23;

f = figure;
set(f,'Units','Inches','Position',[13,5,6.2,1.4]);

ax1 = axes('Units','inches','Position',[lm,bm,wAxes,hAxes]);
hold on;
color = get(ax1,'ColorOrder');
set(ax1,'FontName','Times','FontSize',8);
plot(t,errors.REKF*180/pi,'Color',color(1,:),'LineStyle','-');
plot(t,errors.RMFG*180/pi,'Color',color(2,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
ylim([0,180]);
yticks([0,60,120,180])
ylabel('att err (deg)','Units','inches');

ax2 = axes('Units','inches','Position',[lm+wAxes+dw,bm,wAxes,hAxes]);
hold on;
set(ax2,'FontName','Times','FontSize',8);
plot(t,errors.vEKF,'Color',color(1,:),'LineStyle','-');
plot(t,errors.vMFG,'Color',color(2,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
ylabel('vel err (m/s)','Units','inches');
legend({'MEKF','MFG'},'Orientation','horizontal','Units','Inches',...
    'Position',[2.46,1.19,1.56,0.156]);

ax3 = axes('Units','inches','Position',[lm+2*wAxes+2*dw,bm,wAxes,hAxes]);
hold on;
set(ax3,'FontName','Times','FontSize',8);
plot(t,errors.pEKF,'Color',color(1,:),'LineStyle','-');
plot(t,errors.pMFG,'Color',color(2,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
ylabel('pos err (m)','Units','inches');

print('error','-depsc','-painters');
