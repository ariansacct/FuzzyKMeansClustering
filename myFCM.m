function [ centers,U] = myFCM( mydata,m,epsilon,maxiteration )
 clc
clear U
centers=rand(8,51);
U=zeros(8,11200);
new_objfunc = Inf;

for iteration=1:maxiteration
    
    for i=1:8
        for j=1:11200
            den=0;
            den2=0;
            for k=1:8
                den=den+ ((eucdist(mydata(j,:),centers,i))/(eucdist(mydata(j,:),centers,k)))^(2/(m-1));
            end
            
            
            U(i,j)=(1/den);
        end
    end


    for i=1:8
        nom=zeros(1,51);
        denom=0;
        for j=1:11200
            
            nom=nom+((U(i,j))^m)*mydata(j,:);
            denom=denom+ (U(i,j))^m;
        end
        
        centers(i,:)=nom/denom;
    end
  
    L=0;
    for i = 1:8
        for j=1:11200
        L = L + ((U(i,j)^m) * (eucdist(mydata(j,:),centers,i))^2);
        end
    end
    for j = 1:11200
        for i = 1:8
            L = L - U(i,j);
        end

        L = L +1;
    
    end
    
    
   
    old_objfunc = new_objfunc;
    new_objfunc = L;
    if  abs( old_objfunc - new_objfunc )< epsilon
        disp('about to break')
        break
    end



    
    
    fprintf('Iteration= %d , objective function= %d \n',iteration,L);

end



end

