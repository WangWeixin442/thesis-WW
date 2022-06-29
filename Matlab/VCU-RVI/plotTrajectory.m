clear;
close all;

load('data.mat');

for i = 1:5
    figure('Units','inches','Position',[13,3,3.5,3.5]);
    hold on;
    color = get(gca,'ColorOrder');
    set(gca,'FontName','Times','FontSize',8);

    plot3(data{i}.x_true.p(1,:),data{i}.x_true.p(2,:),data{i}.x_true.p(3,:),'k');
    plot3(data{i}.x_nomap_EKF.p(1,:),data{i}.x_nomap_EKF.p(2,:),data{i}.x_nomap_EKF.p(3,:),'color',color(1,:));
    plot3(data{i}.x_nomap_MFG.p(1,:),data{i}.x_nomap_MFG.p(2,:),data{i}.x_nomap_MFG.p(3,:),'color',color(2,:));
    plot3(data{i}.x_map_EKF.p(1,:),data{i}.x_map_EKF.p(2,:),data{i}.x_map_EKF.p(3,:),'color',color(3,:));
    plot3(data{i}.x_map_MFG.p(1,:),data{i}.x_map_MFG.p(2,:),data{i}.x_map_MFG.p(3,:),'color',color(4,:));

    ylim([min([data{i}.x_true.p(2,:),data{i}.x_nomap_EKF.p(2,:),data{i}.x_nomap_MFG.p(2,:),data{i}.x_map_EKF.p(2,:),data{i}.x_map_MFG.p(2,:)])-0.1,...
        max([data{i}.x_true.p(2,:),data{i}.x_nomap_EKF.p(2,:),data{i}.x_nomap_MFG.p(2,:),data{i}.x_map_EKF.p(2,:),data{i}.x_map_MFG.p(2,:)])+0.1]);
    zlim([min([data{i}.x_true.p(3,:),data{i}.x_nomap_EKF.p(3,:),data{i}.x_nomap_MFG.p(3,:),data{i}.x_map_EKF.p(3,:),data{i}.x_map_MFG.p(3,:)])-0.1,...
        max([data{i}.x_true.p(3,:),data{i}.x_nomap_EKF.p(3,:),data{i}.x_nomap_MFG.p(3,:),data{i}.x_map_EKF.p(3,:),data{i}.x_map_MFG.p(3,:)])+0.1]);

    axis equal;
    view([1,0,0]);

    ylabel('x (m)');
    zlabel('y (m)');

    legend('true','MEKFd','MFGd','MEKFr','MFGr','NumColumns',2,'Location','northoutside');

    print(strcat('VIO-VCU_RVI-trajectory',num2str(i)),'-depsc','-painters');
end
