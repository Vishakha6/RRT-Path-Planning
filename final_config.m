function sampleQ=final_config(nearestQ,Cspace,w,h,m)

    temp_C=Cspace;
    temp=sqrt((nearestQ(1)-Cspace(1))^2+(nearestQ(2)-Cspace(2))^2+((nearestQ(3)-Cspace(3))*100/pi)^2);

    if temp>m
        if Cspace(1)>nearestQ(1)
            temp_C(1)=nearestQ(1)+m*(Cspace(1)-nearestQ(1))/temp;
        else
            temp_C(1)=nearestQ(1)-m*(Cspace(1)-nearestQ(1))/temp;
        end
        temp_C(2)=nearestQ(2)+(temp_C(1)-nearestQ(1))*(Cspace(2)-nearestQ(2))/(Cspace(1)-nearestQ(1));
        temp_C(3)=nearestQ(3)+m*(Cspace(3)-nearestQ(3))/temp;
    end
    dis=20;
    sample=[linspace(nearestQ(1),temp_C(1),dis);linspace(nearestQ(2),temp_C(2),dis);linspace(nearestQ(3),temp_C(3),dis)]';
    i=2;
    while i<=dis && new_config(sample(i,:),w,h)
        i=i+1;
    end
    sampleQ=sample(i-1,:);
end