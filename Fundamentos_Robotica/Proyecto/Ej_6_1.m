%
%  Ejemplo 6.1
%
clear
tiempo=[0 2 4 6 9 25 27]
q=[0 1 3 3 2 5 6]
%qd=[0 0.75 0.5 -0.1667 0 0.3438 0]
r=i_cubico(q,tiempo)
%
N=20; i=1; tt(i)=r(1,1);
for np=1:length(q)-1;
ti=r(np,1); tf=r(np,2); t=ti; inct=(tf-ti)/N;
    for n=1:N
    qt(i)=r(np,3)+r(np,4)*(t-ti)+r(np,5)*(t-ti)^2+r(np,6)*(t-ti)^3;
    tt(i)=t;
    i=i+1; t=t+inct;
    end
end
qt(i)=r(np,3)+r(np,4)*(t-ti)+r(np,5)*(t-ti)^2+r(np,6)*(t-ti)^3;
tt(i)=t;
%
%
figure
tiempo=[0 2 4 6 9 25 27]
q=[0 1 3 3 2 5 6]
qd=[0 0.75 0.5 -0.1667 0 0.3438 0]
r=p_cubico(q,tiempo,qd);
plot(tt,qt);
axis([tiempo(1) max(tiempo) min(q) max(q)+1])
grid;