function xyz = cinDir(in)

q1 = in(1);
q2 = in(2);
q3 = in(3);

L0 = 1.3; L1 = 0.5; L2 = 1; L3A = 0.5; L3B = 1;

x = L2*cos(q1) + L3B*cos(q1) - L1*sin(q1) - L3A*sin(q1)*sin(q2) - q3*sin(q1)*sin(q2);
y = L1*cos(q1) + L2*sin(q1) + L3B*sin(q1) + L3A*cos(q1)*sin(q2) + q3*cos(q1)*sin(q2);
z = L0 - cos(q2)*(L3A + q3);

xyz = [x,y,z]';
end

