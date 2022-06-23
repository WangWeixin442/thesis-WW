clear;
close all;

load('data_largeInitError.mat');
t = 0:1/200:60;

hAxes = 0.8;
wAxes = 3.0;
dh = 0.15;

bm = 0.35;
lm = 0.4;
yllp = -0.23;

f = figure;
set(f,'Units','Inches','Position',[13,5,3.5,5]);

ax1 = axes('Units','inches','Position',[lm,bm,wAxes,hAxes]);
hold on;
color = get(ax1,'ColorOrder');
set(ax1,'FontName','Times','FontSize',8);
plot(t,baError(1,:),'Color',color(1,:),'LineStyle','-');
plot(t,baError(2,:),'Color',color(2,:),'LineStyle','-');
plot(t,baError(3,:),'Color',color(3,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
yl = ylabel('acce bias err (m^2/s)','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax2 = axes('Units','inches','Position',[lm,bm+hAxes+dh,wAxes,hAxes]);
hold on;
set(ax2,'FontName','Times','FontSize',8);
plot(t,vError(1,:),'Color',color(1,:),'LineStyle','-');
plot(t,vError(2,:),'Color',color(2,:),'LineStyle','-');
plot(t,vError(3,:),'Color',color(3,:),'LineStyle','-');
set(ax2,'XTick',[]);
yl = ylabel('vel err (m/s)','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax3 = axes('Units','inches','Position',[lm,bm+2*hAxes+2*dh,wAxes,hAxes]);
hold on;
set(ax3,'FontName','Times','FontSize',8);
plot(t,pError(1,:),'Color',color(1,:),'LineStyle','-');
plot(t,pError(2,:),'Color',color(2,:),'LineStyle','-');
plot(t,pError(3,:),'Color',color(3,:),'LineStyle','-');
set(ax3,'XTick',[]);
yl = ylabel('pos err (m)','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax4 = axes('Units','inches','Position',[lm,bm+3*hAxes+3*dh,wAxes,hAxes]);
hold on;
set(ax4,'FontName','Times','FontSize',8);
plot(t,bgError(1,:)*180/pi,'Color',color(1,:),'LineStyle','-');
plot(t,bgError(2,:)*180/pi,'Color',color(2,:),'LineStyle','-');
plot(t,bgError(3,:)*180/pi,'Color',color(3,:),'LineStyle','-');
set(ax4,'XTick',[]);
yl = ylabel('gyro bias err (deg/s)','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax5 = axes('Units','inches','Position',[lm,bm+4*hAxes+4*dh,wAxes,hAxes]);
hold on;
set(ax5,'FontName','Times','FontSize',8);
plot(t,RError(1,:)*180/pi,'Color',color(1,:),'LineStyle','-');
plot(t,RError(2,:)*180/pi,'Color',color(2,:),'LineStyle','-');
plot(t,RError(3,:)*180/pi,'Color',color(3,:),'LineStyle','-');
set(ax5,'XTick',[]);
legend('MEKF','MFGI','MFGB');
yl = ylabel('att err (deg)','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

print('error','-depsc','-painters');
