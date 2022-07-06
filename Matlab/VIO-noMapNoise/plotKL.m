close all;
clear;

load('KL.mat');

hAxes = 0.8;
wAxes = 3.0;
dh = 0.15;

bm = 0.35;
lm = 0.4;
yllp = -0.23;

f = figure('Units','inches','Position',[13,5,3.5,1.2]);
N = [3,4,6,8,10,12,14,16,18,20];
hold on;
plot(N,flip(KL(2,:)));
plot(N,flip(KL(1,:)));
xlim([3,20]);
xticks(N);
set(gca,'FontName','Times','FontSize',8);
set(gca,'Units','Inches','Position',[lm,bm,wAxes,hAxes]);
xlabel('Number of Points','FontName','Times');
ylabel('KL Divergence','FontName','Times');
legend('LM optimization','MFG');

print('KL','-depsc','-painters');

