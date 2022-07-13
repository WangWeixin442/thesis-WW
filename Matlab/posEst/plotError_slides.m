clear;
close all;

load('data_largeInitError.mat');
t = 0:1/200:60;

hAxes = 0.8;
wAxes = 1.7;
dh = 0.4;
dw = 0.3;

bm = 0.35;
lm = 0.4;
yllp = -0.23;

f = figure;
set(f,'Units','Inches','Position',[13,5,6.2,2.6]);

ax1 = axes('Units','inches','Position',[lm,bm+hAxes+dh,wAxes,hAxes]);
color = get(ax1,'ColorOrder');
hold on;
set(ax1,'FontName','Times','FontSize',8);
plot(t,RError(1,:)*180/pi,'Color',color(1,:),'LineStyle','-');
plot(t,RError(2,:)*180/pi,'Color',color(2,:),'LineStyle','-');
plot(t,RError(3,:)*180/pi,'Color',color(3,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
ylabel('att err (deg)','Units','inches');

ax2 = axes('Units','inches','Position',[lm+wAxes+dw,bm+hAxes+dh,wAxes,hAxes]);
hold on;
set(ax2,'FontName','Times','FontSize',8);
plot(t,vError(1,:),'Color',color(1,:),'LineStyle','-');
plot(t,vError(2,:),'Color',color(2,:),'LineStyle','-');
plot(t,vError(3,:),'Color',color(3,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
ylabel('vel err (m/s)','Units','inches');
legend('MEKF','MFGI','MFGB','Orientation','horizontal','Units','Inches',...
    'Position',[2.00,2.43,2.42,0.156]);

ax3 = axes('Units','inches','Position',[lm+2*wAxes+2*dw,bm+hAxes+dh,wAxes,hAxes]);
hold on;
set(ax3,'FontName','Times','FontSize',8);
plot(t,pError(1,:),'Color',color(1,:),'LineStyle','-');
plot(t,pError(2,:),'Color',color(2,:),'LineStyle','-');
plot(t,pError(3,:),'Color',color(3,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
ylabel('pos err (m)','Units','inches');

ax4 = axes('Units','inches','Position',[lm+wAxes/2,bm,wAxes,hAxes]);
hold on;
set(ax4,'FontName','Times','FontSize',8);
plot(t,bgError(1,:)*180/pi,'Color',color(1,:),'LineStyle','-');
plot(t,bgError(2,:)*180/pi,'Color',color(2,:),'LineStyle','-');
plot(t,bgError(3,:)*180/pi,'Color',color(3,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
ylabel('gyro bias err (deg/s)','Units','inches');

ax5 = axes('Units','inches','Position',[lm+wAxes/2*3+2*dw,bm,wAxes,hAxes]);
hold on;
set(ax5,'FontName','Times','FontSize',8);
plot(t,baError(1,:),'Color',color(1,:),'LineStyle','-');
plot(t,baError(2,:),'Color',color(2,:),'LineStyle','-');
plot(t,baError(3,:),'Color',color(3,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
ylabel('acce bias err (m^2/s)','Units','inches');

print('INS_error','-depsc','-painters');
