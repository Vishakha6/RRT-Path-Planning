function position=robot_position(Cspace,w,h)
    initX=Cspace(1); initY=Cspace(2); theta=Cspace(3);
    Xi=[initX-w/2 initX-w/2 initX+w/2 initX+w/2];
    Yi=[initY-h/2 initY+h/2 initY+h/2 initY-h/2];
    Rotation=[cos(theta) -sin(theta);sin(theta) cos(theta)];
    X=Rotation*[Xi-initX;Yi-initY];
    position=[X(1,:)+initX;X(2,:)+initY];
end