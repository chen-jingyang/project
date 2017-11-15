%% It performs MPSSC by changing \rho for larger-scale data sets


C = max(true_labs); CCC=C;
[n p]=size(in_X)


y=true_labs; [n,p]=size(in_X);
X=in_X; Y=X; y=true_labs; [n,p]=size(X);


rng(50)

rho_set=[0.001,0.01, 0.1, 0.2, 0.5, 1, 2, 5,10];
tot_mpssc_set=cell(1,length(rho_set)); tot_mpssc0_set=cell(1,length(rho_set));
parfor ijk=1:length(rho_set);
%% MPSSC
rho=rho_set(ijk); lam=0.0001; lam2=lam; eta=1; c=0.1;
tic()
[P2, P3] = clus_fin_update_two_step2(rho, lam, lam2, eta, c, in_X, true_labs,30);
toc_mpssc=toc();
[nmi11, nmi22,clus_dou1,clus01]=calc2_nmis(CCC, double(P2),true_labs) ;
pu11=purity(CCC, clus_dou1, true_labs);  pu22=purity(CCC, clus01, true_labs);
tot_mpssc=[nmi11, nmi22;pu11,pu22; RandIndex(clus_dou1,true_labs),RandIndex(clus01,true_labs) ]';
tot_mpssc_set{ijk}=tot_mpssc;


end
