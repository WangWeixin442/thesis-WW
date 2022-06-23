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

%% attitude std
RStd_MEKF = zeros(3,length(t));
RStd_MFGI = zeros(3,length(t));
RStd_MFGB = zeros(3,length(t));

for i = 1:length(t)
    RVar_MEKF = RMEKF(:,:,i)*G.Sigma(1:3,1:3,i)*RMEKF(:,:,i)';
    RVar_MFGI = MFGI.U(:,:,i)*(sum(MFGI.S(:,i))*eye(3)-diag(MFGI.S(:,i)))^-1*MFGI.U(:,:,i)';
    RVar_MFGB = MFGB.U(:,:,i)*(sum(MFGB.S(:,i))*eye(3)-diag(MFGB.S(:,i)))^-1*MFGB.U(:,:,i)';

    RStd_MEKF(:,i) = sqrt(diag(RVar_MEKF))*180/pi;
    RStd_MFGI(:,i) = sqrt(diag(RVar_MFGI))*180/pi;
    RStd_MFGB(:,i) = sqrt(diag(RVar_MFGB))*180/pi;
end

f = figure('Units','inches','Position',[13,5,3.5,3.1]);
ax1 = axes('Units','inches','Position',[lm,bm,wAxes,hAxes]);
hold on;
color = get(ax1,'ColorOrder');
set(ax1,'FontName','Times','FontSize',8);
plot(t(1:4001),RStd_MEKF(3,1:4001),'Color',color(1,:),'LineStyle','-');
plot(t(1:4001),RStd_MFGI(3,1:4001),'Color',color(2,:),'LineStyle','-');
plot(t(1:4001),RStd_MFGB(3,1:4001),'Color',color(3,:),'LineStyle','-');
ylim([0,200]);
xlabel('time (second)','FontName','Times');
legend('MEKF','MFGI','MFGB');
yl = ylabel('$e_3$-axis','Interpreter','latex','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax2 = axes('Units','inches','Position',[lm,bm+hAxes+dh,wAxes,hAxes]);
hold on;
set(ax2,'FontName','Times','FontSize',8);
plot(t(1:4001),RStd_MEKF(2,1:4001),'Color',color(1,:),'LineStyle','-');
plot(t(1:4001),RStd_MFGI(2,1:4001),'Color',color(2,:),'LineStyle','-');
plot(t(1:4001),RStd_MFGB(2,1:4001),'Color',color(3,:),'LineStyle','-');
set(ax2,'XTick',[]);
yl = ylabel('$e_2$-axis','Interpreter','latex','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax3 = axes('Units','inches','Position',[lm,bm+2*hAxes+2*dh,wAxes,hAxes]);
hold on;
set(ax3,'FontName','Times','FontSize',8);
plot(t(1:4001),RStd_MEKF(1,1:4001),'Color',color(1,:),'LineStyle','-');
plot(t(1:4001),RStd_MFGI(1,1:4001),'Color',color(2,:),'LineStyle','-');
plot(t(1:4001),RStd_MFGB(1,1:4001),'Color',color(3,:),'LineStyle','-');
set(ax3,'XTick',[]);
yl = ylabel('$e_1$-axis','Interpreter','latex','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

print('std-att','-depsc','-painters');

%% position std
pStd_MEKF = zeros(3,length(t));
pStd_MFGI = zeros(3,length(t));
pStd_MFGB = zeros(3,length(t));

for i = 1:length(t)
    pVar_MEKF = G.Sigma(7:9,7:9,i);

    EQ_MFGI = pdf_MF_moment(MFGI.S(:,i));
    EvRvR_MFGI = diag([MFGI.S(2,i)*EQ_MFGI(2,2)+MFGI.S(3,i)*EQ_MFGI(3,3),...
        MFGI.S(1,i)*EQ_MFGI(1,1)+MFGI.S(3,i)*EQ_MFGI(3,3),...
        MFGI.S(1,i)*EQ_MFGI(1,1)+MFGI.S(2,i)*EQ_MFGI(2,2)]);
    pVar_MFGI = MFGI.Sigma(4:6,4:6,i) + MFGI.P(4:6,:,i)*(EvRvR_MFGI-(sum(MFGI.S(:,i))*eye(3)-diag(MFGI.S(:,i))))*MFGI.P(4:6,:,i)';

    EQ_MFGB = pdf_MF_moment(MFGB.S(:,i));
    EvRvR_MFGB = diag([MFGB.S(2,i)*EQ_MFGB(2,2)+MFGB.S(3,i)*EQ_MFGB(3,3),...
        MFGB.S(1,i)*EQ_MFGB(1,1)+MFGB.S(3,i)*EQ_MFGB(3,3),...
        MFGB.S(1,i)*EQ_MFGB(1,1)+MFGB.S(2,i)*EQ_MFGB(2,2)]);
    pVar_MFGB = MFGB.Sigma(4:6,4:6,i) + MFGB.P(4:6,:,i)*(EvRvR_MFGB-(sum(MFGB.S(:,i))*eye(3)-diag(MFGB.S(:,i))))*MFGB.P(4:6,:,i)';

    pStd_MEKF(:,i) = sqrt(diag(pVar_MEKF));
    pStd_MFGI(:,i) = sqrt(diag(pVar_MFGI));
    pStd_MFGB(:,i) = sqrt(diag(pVar_MFGB));
end

f = figure('Units','inches','Position',[13,5,3.5,3.1]);
ax1 = axes('Units','inches','Position',[lm,bm,wAxes,hAxes]);
hold on;
color = get(ax1,'ColorOrder');
set(ax1,'FontName','Times','FontSize',8);
plot(t(1:4001),pStd_MEKF(3,1:4001),'Color',color(1,:),'LineStyle','-');
plot(t(1:4001),pStd_MFGI(3,1:4001),'Color',color(2,:),'LineStyle','-');
plot(t(1:4001),pStd_MFGB(3,1:4001),'Color',color(3,:),'LineStyle','-');
xlabel('time (second)','FontName','Times');
legend('MEKF','MFGI','MFGB');
yl = ylabel('$e_3$-axis','Interpreter','latex','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax2 = axes('Units','inches','Position',[lm,bm+hAxes+dh,wAxes,hAxes]);
hold on;
set(ax2,'FontName','Times','FontSize',8);
plot(t(1:4001),pStd_MEKF(2,1:4001),'Color',color(1,:),'LineStyle','-');
plot(t(1:4001),pStd_MFGI(2,1:4001),'Color',color(2,:),'LineStyle','-');
plot(t(1:4001),pStd_MFGB(2,1:4001),'Color',color(3,:),'LineStyle','-');
set(ax2,'XTick',[]);
yl = ylabel('$e_2$-axis','Interpreter','latex','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

ax3 = axes('Units','inches','Position',[lm,bm+2*hAxes+2*dh,wAxes,hAxes]);
hold on;
set(ax3,'FontName','Times','FontSize',8);
plot(t(1:4001),pStd_MEKF(1,1:4001),'Color',color(1,:),'LineStyle','-');
plot(t(1:4001),pStd_MFGI(1,1:4001),'Color',color(2,:),'LineStyle','-');
plot(t(1:4001),pStd_MFGB(1,1:4001),'Color',color(3,:),'LineStyle','-');
set(ax3,'XTick',[]);
yl = ylabel('$e_1$-axis','Interpreter','latex','Units','inches');
ylp = get(yl,'Position');
ylp(1) = yllp;
set(yl,'Position',ylp);

print('std-pos','-depsc','-painters');

