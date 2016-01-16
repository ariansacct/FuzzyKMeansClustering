load mydata.mat
[cent,U]=myFCM(mydata,2,0.001,10)

for p=1:11200
    target(p,1)=find(U(:,p)==max(U(:,p)));
end

[u2,c2,d2]=kmeans(mydata,8);
cost_kmeans = sum(d2)