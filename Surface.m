% clear; close all; clc;

% n =36; % no of sample

[X1,X2] = meshgrid(20:(80-20)/199:80,200:(1000-200)/199:1000); %[d,H]

% constant parameters
F = 150000*ones(length(X1),1);      % External force(N)
E = 210000*ones(length(X1),1);      % Elastic modulus (N/mm^2)
B = 750*ones(length(X1),1);         % Width of the structure (mm)
T = 2.5*ones(length(X1),1);         % Thickness of the cross section (mm)

% load(['Design_surrogate_',num2str(n),'_samples'],...
%     'sur_res','sur_G1','sur_G2');
% figure;
% for i = 1:length(X1)
%     X = [X1(:,i),X2(:,i),B];
%     Y1(i,:) = objectivefunction(X1(:,i),X2(:,i),B);%srgtsKRGEvaluate(X,sur_res);
% end
Y1 = objectivefunction(X1,X2,B);
[C,h] = contour(X1,X2,Y1','ShowText','on');hold on
clabel(C,h,'Fontsize',14);
h.LineWidth = 2;
H = gca;
H.FontSize = 14;

% surfc(X1,X2,Y1');
hold on;
% xlabel('d','Fontname','times','FontWeight','bold','Fontsize',20)
% ylabel('H','Fontname','times','FontWeight','bold','Fontsize',20)
% zlabel('Y_1','Fontname','times','FontWeight','bold','Fontsize',20)

% for i = 1:length(X1)
%     X = [X1(:,i) X2(:,i),B];
%     [~,Y2(i,:)] = objectivefunction(X1(:,i),X2(:,i),B);%srgtsKRGEvaluate(X,sur_G1);
% end

[~,Y2] = objectivefunction(X1,X2,B);
% [C,h]= contour(X1,X2,Y2',[400 400],'ShowText','on'); hold on
% clabel(C,h,'Fontsize',20,'color','red');
% h.LineWidth = 2;
% H = gca;
% H.FontSize = 20;

c1=ocontourc(X1(1,:),X2(:,1),Y2,[400,400]);
hatchedcontours(c1,'k');

% % surfc(X1,X2,Y2');
% xlabel('d','Fontname','times','FontWeight','bold','Fontsize',20)
% ylabel('H','Fontname','times','FontWeight','bold','Fontsize',20)
% zlabel('Y_2','Fontname','times','FontWeight','bold','Fontsize',20)

% for i = 1:length(X1)
%     X = [X1(:,i) X2(:,i),B];
%     [~,~,Y3(i,:)] = objectivefunction(X1(:,i),X2(:,i),B);%srgtsKRGEvaluate(X,sur_G2);
%     
% end
% Y4 = Y2-Y3;
[~,~,Y3] = objectivefunction(X1,X2,B);
% surfc(X1,X2,Y3');hold on
% figure;
% [C,h] = contour(X1,X2,Y3',[0 0],'ShowText','on');hold on
% allH = allchild(h);
% valueToHide = 1;
% patchValues = cell2mat(get(allH,'UserData'));
% patchesToHide = patchValues == valueToHide;
% set(allH(patchesToHide),'FaceColor','r','FaceAlpha',0.1);

c2=ocontourc(X1(1,:),X2(:,1),Y3',[0,0]);
hatchedcontours(c2,'k');
clabel(C,h,'Fontsize',14,'color','blue');

h.LineWidth = 2;
H = gca;
H.FontSize = 14;
% H.FaceAlpha = 0.4;
xlabel('d','Fontname','times','FontWeight','bold','Fontsize',14)
ylabel('H','Fontname','times','FontWeight','bold','Fontsize',14)
% zlabel('Y_2-Y_3','Fontname','times','FontWeight','bold','Fontsize',20)






function [f, g1, g2] = objectivefunction(d,H,B)
T=2.5*ones(length(d),1); F=150000*ones(length(d),1); E=210000*ones(length(d),1);
f = 2*pi.*T.*d.*sqrt(B.^2+H.^2);
g1 = (F.*sqrt(B.^2+H.^2))./(2*pi.*T.*H.*d);
g2 = g1-((pi^2.*E.*(T.^2+d.^2))./(8*(B.^2+H.^2)));
end


