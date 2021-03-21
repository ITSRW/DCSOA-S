function [ChaoticPoiintsz]=DLCS(x0,y0,z0,a,b,c,T,Dim)
    ChaoticPoiintsz=zeros(Dim,T);
    Ox=x0;
    Oy=y0;
    Oz=z0;
    aband=100;
    P=6;
    I=10^16;
    MOD = 10 ^ P;
    step=0.01;
    ox=Ox;
    oy=Oy;
    oz=Oz;
    for D=1:1:Dim
        x0=ox;
        y0=oy;
        z0=oz;
        a=a+rand()/10;
        b=b+rand()/10;
        c=c+rand()/10;
        for t=1:1:T+aband         
            Ox = x0 + step * (a * (y0 - x0));
            Oy = y0 + step * (b * x0 - x0 * z0 - y0);
            Oz = z0 + step * (x0^2 + sin(x0*y0) - c * z0);
            x0 = Ox;
            y0 = Oy;
            z0 = Oz;
            if t>aband
                ChaoticPoiintsz(D,t-aband)=mod(z0*I,MOD);
            end
        end
    end
end