function y = response(x)
        x1 = x(:,1);
x2 = x(:,2);
rho = 10000;
y = rho.*x1.*sqrt(1+(x2.^2));
%  y = srgtsKRGEvaluate([x,rho],sur_res);
%         y = rho.*x(1).*sqrt(1+(x(2)).^2);
end