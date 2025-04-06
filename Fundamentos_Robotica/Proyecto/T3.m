function [qt,tt] = T3(in)

qi = in(:,1);
t = in(:,2);

N = 100;
i = 1;


r = i_cubico(qi,t);
tt(i) = r(1,1);
for np=1:length(qi)-1
ti=r(np,1); tf=r(np,2); t=ti; inct=(tf-ti)/N;
    for n=1:N
    qt(i)=r(np,3)+r(np,4)*(t-ti)+r(np,5)*(t-ti)^2+r(np,6)*(t-ti)^3;
    tt(i)=t;
    i=i+1; t=t+inct;
    end
end

qt(i)=r(np,3)+r(np,4)*(t-ti)+r(np,5)*(t-ti)^2+r(np,6)*(t-ti)^3;
tt(i)=t;