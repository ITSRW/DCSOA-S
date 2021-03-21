function [lb,ub,dim,fobj] = Get_Functions_details(F)
    switch F
        case 'F1'
            fobj = @F1;
            lb=-100;
            ub=100;
            dim=30;

        case 'F2'
            fobj = @F2;
            lb=-10;
            ub=10;
            dim=30;

        case 'F3'
            fobj = @F3;
            lb=-100;
            ub=100;
            dim=30;

        case 'F4'
            fobj = @F4;
            lb=-100;
            ub=100;
            dim=30;

        case 'F5'
            fobj = @F5;
            lb=-30;
            ub=30;
            dim=30;

        case 'F6'
            fobj = @F6;
            lb=-100;
            ub=100;
            dim=30;

        case 'F7'
            fobj = @F7;
            lb=-500;
            ub=500;
            dim=30;

        case 'F8'
            fobj = @F8;
            lb=-5.12;
            ub=5.12;
            dim=30;

        case 'F9'
            fobj = @F9;
            lb=-32;
            ub=32;
            dim=30;

        case 'F10'
            fobj = @F10;
            lb=-600;
            ub=600;
            dim=30;

        case 'F11'
            fobj = @F11;
            lb=-50;
            ub=50;
            dim=30;

        case 'F12'
            fobj = @F12;
            lb=-50;
            ub=50;
            dim=30;

        case 'F13'
            fobj = @F13;
            lb=-5;
            ub=5;
            dim=4;

        case 'F14'
            fobj = @F14;
            lb=-5;
            ub=5;
            dim=2;

        case 'F15'
            fobj = @F15;
            lb=-2;
            ub=2;
            dim=2;

    end
end

% F1
function o = F1(x)
    o=sum((x-10).^2);
end

% F2
function o = F2(x)
    o=sum(abs(x-5))+prod(abs(x-5));
end

% F3
function o = F3(x)
    dim=size(x,2);
    o=0;
    for i=1:dim
        o=o+sum(x(1:i))^2;
    end
end

% F4
function o = F4(x)
    o=max(abs(x-7));
end

% F5
function o = F5(x)
    dim=size(x,2);
    o=sum(100*(x(2:dim)-(x(1:dim-1).^2)).^2+(x(1:dim-1)-1).^2);
end

% F6
function o = F6(x)
    o=sum(abs((x+.5)).^2);
end

% F7
function o = F7(x)
    o=sum(-(x-7).*sin(sqrt(abs(x-7))));
end

% F8
function o = F8(x)
    dim=size(x,2);
    o=sum((x-1).^2-10*cos(2*pi.*(x-1)))+10*dim;
end

% F9
function o = F9(x)
    dim=size(x,2);
    o=-20*exp(-.2*sqrt(sum((x-2).^2)/dim))-exp(sum(cos(2*pi.*(x-2)))/dim)+20+exp(1);
end

% F10
function o = F10(x)
    dim=size(x,2);
    o=sum((x-21).^2)/4000-prod(cos((x-21)./sqrt([1:dim])))+1;
end

% F11
function o = F11(x)
    dim=size(x,2);
    o=(pi/dim)*(10*((sin(pi*(1+(x(1)+1)/4)))^2)+sum((((x(1:dim-1)+1)./4).^2).*...
    (1+10.*((sin(pi.*(1+(x(2:dim)+1)./4)))).^2))+((x(dim)+1)/4)^2)+sum(Ufun(x,10,100,4));
end

% F12
function o = F12(x)
    dim=size(x,2);
    o=.1*((sin(3*pi*x(1)))^2+sum((x(1:dim-1)-1).^2.*(1+(sin(3.*pi.*x(2:dim))).^2))+...
    ((x(dim)-1)^2)*(1+(sin(2*pi*x(dim)))^2))+sum(Ufun(x,5,100,4));
end

% F13
function o = F13(x)
    aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
    bK=[.25 .5 1 2 4 6 8 10 12 14 16];bK=1./bK;
    o=sum((aK-((x(1).*(bK.^2+x(2).*bK))./(bK.^2+x(3).*bK+x(4)))).^2);
end

% F14
function o = F14(x)
    o=4*(x(1)^2)-2.1*(x(1)^4)+(x(1)^6)/3+x(1)*x(2)-4*(x(2)^2)+4*(x(2)^4);
end

% F15
function o = F15(x)
    o=(1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*(x(1)^2)-14*x(2)+6*x(1)*x(2)+3*x(2)^2))*...
        (30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*(x(1)^2)+48*x(2)-36*x(1)*x(2)+27*(x(2)^2)));
end