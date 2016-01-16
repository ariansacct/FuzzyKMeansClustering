function [distance] = eucdist(mypoint,centers,k)
d=0;
for i=1:size(mypoint,2)
    d=d+(mypoint(i)- centers(k,i))^2;
end
distance=d^0.5;
end


