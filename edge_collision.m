function v=edge_collision(position)
    v=0;
    dis=10;

    X=linspace(position(1,1),position(1,2),dis); Y=linspace(position(2,1),position(2,2),dis);
    for i=2:dis-1
        x=X(i); y=Y(i);
        if ~((10<x && x<70 && 140<y && y<190) || (70<=x && x<=130 && 150<y && y<170) || (130<x && x<190 && 130<y && y<190) || (150<x && x<170 && 70<=y && y<=130) || (130<x && x<190 && 10<y && y<70))
            v=1;
            return
        end
    end

    X=linspace(position(1,2),position(1,3),dis); Y=linspace(position(2,2),position(2,3),dis);
    for i=2:dis-1
        x=X(i); y=Y(i);
        if ~((10<x && x<70 && 140<y && y<190) || (70<=x && x<=130 && 150<y && y<170) || (130<x && x<190 && 130<y && y<190) || (150<x && x<170 && 70<=y && y<=130) || (130<x && x<190 && 10<y && y<70))
            v=1;
            return
        end
    end

    X=linspace(position(1,3),position(1,4),dis); Y=linspace(position(2,3),position(2,4),dis);
    for i=2:dis-1
        x=X(i); y=Y(i);
        if ~((10<x && x<70 && 140<y && y<190) || (70<=x && x<=130 && 150<y && y<170) || (130<x && x<190 && 130<y && y<190) || (150<x && x<170 && 70<=y && y<=130) || (130<x && x<190 && 10<y && y<70))
            v=1;
            return
        end
    end

    X=linspace(position(1,4),position(1,1),dis); Y=linspace(position(2,4),position(2,1),dis);
    for i=2:dis-1
        x=X(i); y=Y(i);
        if ~((10<x && x<70 && 140<y && y<190) || (70<=x && x<=130 && 150<y && y<170) || (130<x && x<190 && 130<y && y<190) || (150<x && x<170 && 70<=y && y<=130) || (130<x && x<190 && 10<y && y<70))
            v=1;
            return
        end
    end
end

        
        