% ECE 6720
% ODE Test

syms y  
x=0:1:10;
eqn = 2*x+y == 0;
for ii = 1:1:length(eqn)
    sol(ii) = solve(eqn(ii),y);
end

figure
plot(x,sol)
title('Solution to 2x+y = 0')

x1=0:1:10;
eqn1 = x.^2+4*y == 0;
for jj = 1:1:length(eqn1)
    sol1(jj) = solve(eqn1(jj),y);
end

figure
plot(x1,sol1)
title('Solution to x^2+4*y = 0')

