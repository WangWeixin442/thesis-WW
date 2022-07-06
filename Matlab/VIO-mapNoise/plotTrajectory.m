clear;
close all;

%% filter 1
load('data_filter1.mat');

ind = find(sum(mea_pos.p(1,:,:),3)~=0);

figure('Units','Inches','Position',[13,5,4,2.8]);
hold on;
color = get(gca,'ColorOrder');
set(gca,'Units','Inches');

plot3(x_true.p(1,:),x_true.p(2,:),x_true.p(3,:),'k');
plot3(x_EKF.p(1,:),x_EKF.p(2,:),x_EKF.p(3,:),'color',color(1,:));
plot3(x_MFG.p(1,:),x_MFG.p(2,:),x_MFG.p(3,:),'color',color(2,:));

scatter3(fea_pos_true(1,ind),fea_pos_true(2,ind),fea_pos_true(3,ind),'k.');
scatter3(map_EKF.p(1,ind),map_EKF.p(2,ind),map_EKF.p(3,ind),'.','MarkerEdgeColor',color(1,:));
scatter3(map_MFG.p(1,ind),map_MFG.p(2,ind),map_MFG.p(3,ind),'.','MarkerEdgeColor',color(2,:));

axis equal;
xlim([-5,10]);
ylim([-6,6]);
view([20,28]);

legend('true trajector','MEKF trajectory','MFG trajectory',...
    'true landmarks','MEKF landmarks','MFG landmarks',...
    'FontName','Times','FontSize',9,'NumColumns',2,...
    'Units','Inches','Position',[0.632,2.096,2.833,0.490]);
set(gca,'FontName','Times','FontSize',9);
xlabel('x (m)');
ylabel('y (m)');

set(gca,'Position',[0.530,0.053,3.100,2.135]);

print('trajectory1','-depsc','-painters');

%% filter 2
load('data_filter2.mat');

ind = find(sum(mea_pos.p(1,:,:),3)~=0);

figure('Units','Inches','Position',[13,5,4,2.8]);
hold on;
color = get(gca,'ColorOrder');
set(gca,'Units','Inches');

plot3(x_true.p(1,:),x_true.p(2,:),x_true.p(3,:),'k');
plot3(x_EKF.p(1,:),x_EKF.p(2,:),x_EKF.p(3,:),'color',color(1,:));
plot3(x_MFG.p(1,:),x_MFG.p(2,:),x_MFG.p(3,:),'color',color(2,:));

scatter3(fea_pos_true(1,ind),fea_pos_true(2,ind),fea_pos_true(3,ind),'k.');
scatter3(map_EKF.p(1,ind),map_EKF.p(2,ind),map_EKF.p(3,ind),'.','MarkerEdgeColor',color(1,:));
scatter3(map_MFG.p(1,ind),map_MFG.p(2,ind),map_MFG.p(3,ind),'.','MarkerEdgeColor',color(2,:));

axis equal;
xlim([-5,15]);
ylim([-6,6]);
view([20,28]);

legend('true trajector','MEKF trajectory','MFG trajectory',...
    'true landmarks','MEKF landmarks','MFG landmarks',...
    'FontName','Times','FontSize',9,'NumColumns',2,...
    'Units','Inches','Position',[0.632,2.096,2.833,0.490]);
set(gca,'FontName','Times','FontSize',9);
xlabel('x (m)');
ylabel('y (m)');

set(gca,'Position',[0.530,0.053,3.100,2.135]);

print('trajectory2','-depsc','-painters');
