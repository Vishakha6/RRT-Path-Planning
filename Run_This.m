clc

figure
hold on

% clear;
% mapSize = 200;
%     mapMatrix = ones(mapSize,mapSize);
%  
% 
% rectangle('Position',[0,0,200,200],'Facecolor', 'b')
% rectangle('Position',[10,130,60,60],'Facecolor', 'w')
% rectangle('Position',[70,150,60,20],'Facecolor', 'w')
% rectangle('Position',[130,130,60,60],'Facecolor', 'w')
% rectangle('Position',[130,10,60,60],'Facecolor', 'w')
% rectangle('Position',[150,70,20,60],'Facecolor', 'w')
% 
% hold on
% qi = rectangle('Position',[25,145,10,30],'Facecolor', 'y');
% hold on 
% xinit = plot(30,160,'r.');
% xfinal = plot(160,30,'r.');
% 
% mapMatrix(10:70,130:190) = 0;
% mapMatrix(70:130, 150:170) = 0;
% mapMatrix(130:190, 130:190) = 0;
% mapMatrix(150:170, 70:130) = 0;
% mapMatrix(130:190, 10:70) = 0;


%map creation%
patch([0 10 10 0],[0 0 200 200],'blue','edgecolor','none')
patch([0 200 200 0],[0 0 10 10],'blue','edgecolor','none')
patch([190 200 200 190],[0 0 200 200],'blue','edgecolor','none')
patch([0 200 200 0],[190 190 200 200],'blue','edgecolor','none')
patch([10 130 130 10],[10 10 140 140],'blue','edgecolor','none')
patch([70 130 130 70],[130 130 150 150],'blue','edgecolor','none')
patch([70 130 130 70],[170 170 190 190],'blue','edgecolor','none')
patch([130 130 150 150],[130 70 70 130],'blue','edgecolor','none')
patch([170 170 190 190],[130 70 70 130],'blue','edgecolor','none')
axis off

%drawing robot%
robot.width=30; robot.height=10;
robot.max_step=30;
initX=30; initY=160; thetai=pi/2;
initC=[initX initY thetai];
position=robot_position(initC,robot.width,robot.height);
temp2=patch(position(1,:),position(2,:),'yellow');
drawnow
%------------------------------------------------------------------------------------------------------------------------------------------------------%

goalC=[160 30 0];
[Z,iters]=RRT(initC,goalC,robot.width,robot.height,robot.max_step);
m=size(Z.node);
temp1=Z.node(m(1),:);
pathTree=temp1;
%-------------------------------------------------------------------------------------------------------------------------------------------------------%


%final plot%
while ~isnan(temp1)
    i=find(Z.node(:,1)==temp1(1) & Z.node(:,2)==temp1(2) & Z.node(:,3)==temp1(3));
    temp1=Z.parent(i,:);
    pathTree=[pathTree;temp1];
end
pathTree=flipud(pathTree);
temp=size(pathTree);
for i=2:temp(1)
    delete(temp2)
    position=robot_position(pathTree(i,:),robot.width,robot.height);
    temp2=patch(position(1,:),position(2,:),'yellow');
    plot([pathTree(i-1,1) pathTree(i,1)],[pathTree(i-1,2) pathTree(i,2)],'-r','linewidth',2)
    drawnow
    pause(0.3)
   
end
delete(temp2)
position=robot_position(goalC,robot.width,robot.height);
temp2=patch(position(1,:),position(2,:),'yellow');
plot([pathTree(temp(1),1) goalC(1)],[pathTree(temp(1),2) goalC(2)],'-r','linewidth',2)