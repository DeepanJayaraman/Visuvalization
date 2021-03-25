% clear; close all; clc;

% n =36; % no of sample
lb = [0.2 0.1]; % lower bound specification
ub = [20 1.6];  % upper bound specification
[X1,X2] = meshgrid(0.2:(20-0.2)/199:20,0.1:(1.6-0.1)/199:1.6); %[d,H]

NN = [10,25,50,100];
addpath('D:\2020 lockdown\Aspenberg function')
for i = 1:length(NN)
    N = NN(i);
    load(['Robust_64_',num2str(N),'_Samples.mat'],'y_SD_ext','y_lmom_ext');
    cont(X1,X2,y_SD_ext,y_lmom_ext)
    saveas(gcf,['Twobar_truss_cont_RDO_',num2str(N),'_samples.fig'])
    set(gcf,'Paperunits','inches','Paperposition',[0 0 4.3 4.2])
    print('-dpng',['Twobar_truss_cont_RDO_',num2str(N),'_samples.png'],'-r400')
    figure;
end
% axis equal
% axis([20 200 80 1000])

function CC = cont(X1,X2,x_F_ext,x_F_lmom_ext)
% constant parameters

Y1 = objectivefunction(X1,X2);
[C,h] = contour(X1,X2,Y1,'ShowText','on');hold on
clabel(C,h,'Fontsize',16);
h.LineWidth = 2;
H = gca;
H.FontSize = 16;
colormap( flipud(gray(256)))
[~, g1, g2] = objectivefunction(x_F_ext(:,1),x_F_ext(:,2));
O = or(g2<0,g1<0);
x_F_ext(O,:)=[];
[~, g1, g2] = objectivefunction(x_F_lmom_ext(:,1),x_F_lmom_ext(:,2));
O = or(g2<0,g1<0);
x_F_lmom_ext(O,:)=[];


scatter(x_F_ext(:,1),x_F_ext(:,2),'ok','MarkerFaceColor','k');alpha(0.05); hold on;
scatter(x_F_lmom_ext(:,1),x_F_lmom_ext(:,2),'.r');
hold on;

[~,Y2] = objectivefunction(X1,X2);
contour(X1,X2,Y2);
c1=ocontourc(X1(1,:),X2(:,1),Y2,[0,0],'true');
hatchedcontours(c1,'k');
text(6,0.9, .1, '$g_1=0$','interpreter','latex','Fontsize',16)

[~,~,Y3] = objectivefunction(X1,X2);


c2=ocontourc(X1(1,:),X2(:,1),Y3,[0,0],'fasle');
hatchedcontours(c2,'k');
clabel(C,h,'Fontsize',16,'color','k');
text(2,1, .1, '$g_2=0$','interpreter','latex','Fontsize',16)
h.LineWidth = 2;
H = gca;
H.FontSize = 16;
% H.FaceAlpha = 0.4;
xlabel('$X_1$','Fontname','times','FontWeight','bold','Fontsize',16,'interpreter','Latex')
ylabel('$X_2$','Fontname','times','FontWeight','bold','Fontsize',16,'interpreter','Latex')

legend ({'$f$','C-moment','L-moment'},'interpreter','Latex','fontsize',12,'fontname','times')
end


function [f, g1, g2] = objectivefunction(x1,x2)
rho = 10000*ones(length(x1),1);         % Width of the structure (mm)
Q = 800*ones(length(x1),1); 
S = 1050*ones(length(x1),1); 
% x1 = x(1);
% x2 = x(2);

f = rho.*x1.*sqrt(1+(x2.^2));
g1 = 1-(0.6202.*(Q./S).*(sqrt(1+(x2.^2))).*((8./x1)+(1./(x1.*x2))));
g2 = 1-(0.6202.*(Q./S).*(sqrt(1+x2.^2)).*((8./x1)-(1./(x1.*x2))));
end


