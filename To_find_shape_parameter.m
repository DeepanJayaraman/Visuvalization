%% normal
        N = 1e6;
        x = normrnd(2,2,N,1);
        xs = sort(x);
        xt = xs(0.9*N:N)-xs(0.9*N);
        par = gpfit(xt(2:0.1*N+1));
        estXi = par(1)
        
        
%%          log normal

N = 1e6; %Sapmle size
% k = -0.2;
m = 0.25;
v = 2;

% Exact solution 

mu = log((m^2)/sqrt(v+m^2));
v1 = sqrt(log(v/(m^2)+1));
% mu =2;v =2;
% mu = log((m^2)/sqrt(v+m^2))
% sigma = sqrt(log(v/(m^2)+1))


x = lognrnd(mu,v1,N,1);
        xs = sort(x);
        xt = xs(0.9*N:N)-xs(0.9*N);
        par = gpfit(xt(2:0.1*N+1));
        estXi = par(1)
        
        
        
%%         exponential

mu = 2;

N = 1e6;
 
 x = exprnd(mu,N,1);
        xs = sort(x);
        xt = xs(0.9*N:N)-xs(0.9*N);
        par = gpfit(xt(2:0.1*N+1));
        estXi = par(1)