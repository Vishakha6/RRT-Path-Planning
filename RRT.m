function [Z,iters]=RRT(initC,goalC,w,h,max_step)
    sampleQ=initC;
    Z.node=sampleQ;
    Z.parent=[nan nan nan];
   
    iters=0;
    while sqrt((sampleQ(1)-goalC(1))^2+(sampleQ(2)-goalC(2))^2+((sampleQ(3)-goalC(3))*100/pi)^2)>max_step
   
        if mod(iters,5)==4
            Cspace=goalC;
        else
            Cspace=[randi(200,[1,2]) -pi+2*pi*rand()];
        end
        nearestQ=nearest_nodes(Z.node,Cspace);
        sampleQ=final_config(nearestQ,Cspace,w,h,max_step);
        if sampleQ~=nearestQ
            Z.node=[Z.node;sampleQ];
            Z.parent=[Z.parent;nearestQ];
        end
        iters=iters+1;
    end
end
    