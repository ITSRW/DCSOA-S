function [x]=chaosdrift(x,ub,lb)
    %Map chaos drift swarm into 0-1 space
    if size(x,1)<=3
        x=rand(size(x,1),size(x,2));
    else
        for D=1:1:size(x,2)
            x(:,D)=(x(:,D)-min(x(:,D)))*0.998/(max(x(:,D))-min(x(:,D)))+0.001;
        end
        %Chaos drift swarm evolve through arcsin-logistic system
        for i=1:1:10
            x=x.*4.*(1.-x);
        end
        x=asin(x.^0.5);
    end

    %Map chaotic drift swarm back to solution space
    if size(x,1)<=3
        x=x*(ub-lb)+lb;
    else
        for D=1:1:size(x,2)
            x(:,D)=(x(:,D)-min(x(:,D)))*(ub-lb)/(max(x(:,D))-min(x(:,D)))+lb;
        end
    end
end