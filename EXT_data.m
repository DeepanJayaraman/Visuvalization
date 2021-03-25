clear;
n = 64;
NN = [10,25,50,100];

for i = 1:length(NN)
    N = NN(i);
    load(['Robust_',num2str(n),'_',num2str(N),'_Samples'],'y_SD_ext','y_lmom_ext');
    switch N
        case 10
            F_ex_10 = response(y_SD_ext);
            F_lmom_ex_10 = response(y_lmom_ext);
            F10 = [F_ex_10 F_lmom_ex_10];
            X1_10 = [y_SD_ext(:,1) y_lmom_ext(:,1)];
            X2_10 = [y_SD_ext(:,2) y_lmom_ext(:,2)];
            S10 = std(F10);
        case 25
            F_ex_25 = response(y_SD_ext);
            F_lmom_ex_25 = response(y_lmom_ext);
            F25 = [F_ex_25 F_lmom_ex_25];
            X1_25 = [y_SD_ext(:,1) y_lmom_ext(:,1)];
            X2_25 = [y_SD_ext(:,2) y_lmom_ext(:,2)];
        case 50
            F_ex_50 = response(y_SD_ext);
            F_lmom_ex_50 = response(y_lmom_ext);
            F50 = [F_ex_50 F_lmom_ex_50];
            X1_50 = [y_SD_ext(:,1) y_lmom_ext(:,1)];
            X2_50 = [y_SD_ext(:,2) y_lmom_ext(:,2)];
        case 100
            F_ex_100 = response(y_SD_ext);
            F_lmom_ex_100 = response(y_lmom_ext);
            F100 = [F_ex_100 F_lmom_ex_100];
            X1_100 = [y_SD_ext(:,1) y_lmom_ext(:,1)];
            X2_100 = [y_SD_ext(:,2) y_lmom_ext(:,2)];
    end
end
F = [F10 F25 F50 F100];
S = std(F);
P = prctile(F,[50,25,75]);
X1 = [X1_10 X1_25 X1_50 X1_100];
X2 = [X2_10 X2_25 X2_50 X2_100];

P1 = prctile(X1,[50,25,75]);
P2 = prctile(X2,[50,25,75]);