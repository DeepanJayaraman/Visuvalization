%% distribution with all type of tails

clear ; close all; clc;
mu = 2;
sigma = 2;

% normal
X = [-10:0.01:40];
Y = normpdf(X,mu,sigma);
plot(X,Y);


hold on;
X = [0:0.01:40];
% exponential
Y = exppdf(X,mu);

plot(X,Y);

hold on;

m = 2;
v = 2;
% Exact solution 

mu = log((m^2)/sqrt(v+m^2));v = sqrt(log(v/(m^2)+1));


X = [0:0.01:40];
%log normal
% mu = log((mu^2)/sqrt(sigma+mu^2));v = sqrt(log(sigma/(mu^2)+1));
Y = lognpdf(X,mu,v);

plot(X,Y);


ylabel('PDF','fontsize',14,'FontWeight','bold','FontName', 'Times');
set(gca,'fontsize',14,'FontWeight','bold','FontName', 'Times');
xlabel('x','fontsize',14,'FontWeight','bold','FontName', 'Times');
ylim([0, 0.5])
legend({'Normal - Light tail', 'Exponential - Medium tail','Lognormal - Heavy tail'});

% saveas(gcf,'PDF_alltail.fig')
set(gcf,'PaperUnits','inches','PaperPosition',[0 0  3.43 3.25])
print('-dpng','PDF_alltail.png','-r400')

