clear;
close all;

%% filter 1
load('data_filter1.mat');

ind = find(sum(mea_pos.p(1,:,:),3)~=0);

figure('Units','Inches','Position',[13,5,4,3.7]);
hold on;
color = get(gca,'ColorOrder');

plot3(x_true.p(1,:),x_true.p(2,:),x_true.p(3,:),'k');
plot3(x_EKF.p(1,:),x_EKF.p(2,:),x_EKF.p(3,:),'color',color(1,:));
plot3(x_MFG.p(1,:),x_MFG.p(2,:),x_MFG.p(3,:),'color',color(2,:));

scatter3(fea_pos_true(1,ind),fea_pos_true(2,ind),fea_pos_true(3,ind),'k.');
scatter3(map_EKF.p(1,ind),map_EKF.p(2,ind),map_EKF.p(3,ind),'.','MarkerEdgeColor',color(1,:));
scatter3(map_MFG.p(1,ind),map_MFG.p(2,ind),map_MFG.p(3,ind),'.','MarkerEdgeColor',color(2,:));

axis equal;
xlim([-5,10]);
ylim([-6,6]);

legend('true trajector','MEKF trajectory','MFG trajectory',...
    'true landmarks','MEKF landmarks','MFG landmarks',...
    'FontName','Times','FontSize',9,'Location','northoutside','NumColumns',2);
set(gca,'FontName','Times','FontSize',9);
xlabel('x (m)');
ylabel('y (m)');

print('trajectory1','-depsc','-painters');

%% filter 2
load('data_filter2.mat');

ind = find(sum(mea_pos.p(1,:,:),3)~=0);

figure('Units','Inches','Position',[13,5,4,3.2]);
hold on;
color = get(gca,'ColorOrder');

plot3(x_true.p(1,:),x_true.p(2,:),x_true.p(3,:),'k');
plot3(x_EKF.p(1,:),x_EKF.p(2,:),x_EKF.p(3,:),'color',color(1,:));
plot3(x_MFG.p(1,:),x_MFG.p(2,:),x_MFG.p(3,:),'color',color(2,:));

scatter3(fea_pos_true(1,ind),fea_pos_true(2,ind),fea_pos_true(3,ind),'k.');
scatter3(map_EKF.p(1,ind),map_EKF.p(2,ind),map_EKF.p(3,ind),'.','MarkerEdgeColor',color(1,:));
scatter3(map_MFG.p(1,ind),map_MFG.p(2,ind),map_MFG.p(3,ind),'.','MarkerEdgeColor',color(2,:));

axis equal;
xlim([-5,15]);
ylim([-6,6]);

legend('true trajector','MEKF trajectory','MFG trajectory',...
    'true landmarks','MEKF landmarks','MFG landmarks',...
    'FontName','Times','FontSize',9,'Location','northoutside','NumColumns',2);
set(gca,'FontName','Times','FontSize',9);
xlabel('x (m)');
ylabel('y (m)');

print('trajectory2','-depsc','-painters');