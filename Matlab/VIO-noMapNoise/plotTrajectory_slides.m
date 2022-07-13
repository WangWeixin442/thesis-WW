clear;
close all;

load('data-largeInitErr.mat');

figure('Units','inches');
hold on;
color = get(gca,'ColorOrder');

plot3(x_true.p(1,:),x_true.p(2,:),x_true.p(3,:),'k');
scatter3(fea_pos(1,:),fea_pos(2,:),fea_pos(3,:),'k.');
plot3(x_est_MEKF.p(1,:),x_est_MEKF.p(2,:),x_est_MEKF.p(3,:),'color',color(1,:));
plot3(x_est_MFG.p(1,:),x_est_MFG.p(2,:),x_est_MFG.p(3,:),'color',color(2,:));

axis equal;
view([63,23]);

set(gca,'FontSize',9,'FontName','Times');
xlabel('x (m)');
ylabel('y (m)');
zlabel('z (m)');

set(gcf,'Position',[12,5,5.8,2.9]);

legend({'True trajectory','Landmarks','MEKF trajectory','MFG trajectory'},...
    'Units','inches','Position',[3.85,2.13,1.30,0.6]);

print('VIO-NoMap-Trajectory','-depsc','-painters');
