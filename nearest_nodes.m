function nearestQ=nearest_nodes(nodes,Cspace)
    m=size(nodes);
  
    seq=1:m;
  
    dis=sqrt((nodes(seq(1),1)-Cspace(1))^2+(nodes(seq(1),2)-Cspace(2))^2+((nodes(seq(1),3)-Cspace(3))*100/pi)^2);
  
    nearestQ=nodes(seq(1),:);
    for i=2:length(seq)
  
        temp=sqrt((nodes(seq(i),1)-Cspace(1))^2+(nodes(seq(i),2)-Cspace(2))^2+((nodes(seq(i),3)-Cspace(3))*100/pi)^2);
  
        if temp<dis
            dis=temp;
            nearestQ=nodes(seq(i),:);
        end
    end
end
        