%% robust_generator_k performs PSSC and MPSSC by changing k


C = max(true_labs); CCC=C; 
[n p]=size(in_X)


y=true_labs; [n,p]=size(in_X); 
X=in_X; Y=X; y=true_labs; [n,p]=size(X); 


rng(50)

k_set=5:5:40;
tot_mpssc_set=cell(1,length(k_set)); tot_mpssc0_set=cell(1,length(k_set));
parfor ijk=1:length(k_set);
%% MPSSC
c=0.1;  k=k_set(ijk); rho=0.2; lam=0.0001; lam2=lam; eta=1;    %cases=1 when sparse kernels are used. 
tic()
[P2] = clus_fin_update_k(rho, lam, lam2, eta, c, in_X, true_labs, k);
toc_mpssc=toc();
[nmi11, nmi22,clus_dou1,clus01]=calc2_nmis(CCC, double(P2),true_labs) ;    
pu11=purity(CCC, clus_dou1, true_labs);  pu22=purity(CCC, clus01, true_labs); 
tot_mpssc=[nmi11, nmi22;pu11,pu22; RandIndex(clus_dou1,true_labs),RandIndex(clus01,true_labs) ]';
tot_mpssc_set{ijk}=tot_mpssc;


%% MPSSC0
eta=1;  
tic()
[P20] = clus_fin_update_no_learning_kk(rho, lam, lam2, eta, c, in_X, true_labs, k);
toc_mpssc0=toc();
[nmi11, nmi22,clus_dou1,clus01]=calc2_nmis(CCC, double(P20),true_labs) ;
pu11=purity(CCC, clus_dou1, true_labs);  pu22=purity(CCC, clus01, true_labs);
tot_mpssc0=[nmi11, nmi22;pu11,pu22; RandIndex(clus_dou1,true_labs),RandIndex(clus01,true_labs) ]';
tot_mpssc0_set{ijk}=tot_mpssc0;
end




