function mpo=mpo_add(mpo0)
[m,n]=size(mpo0);
mpo=mpo0(1,:);
for k=2:m
m1=2*(k-1);
o=zeros(m1,2);
j=1;
W=[reshape(mpo{j},[2,m1]),reshape(mpo0{k,j},[2,2])];
W=reshape(W,[1,2,2,k]);
mpo{j}=W;
for j=2:n-1
temp=permute(mpo{j},[2,1,3,4]);
W=[reshape(temp,[m1,m1]),o;o',reshape(mpo0{k,j},[2,2])];
W=reshape(W,[2,k,2,k]);
W=permute(W,[2,1,3,4]); 
mpo{j}=W;
end
j=n;
temp=permute(mpo{j},[2,1,3,4]);
W=[reshape(temp,[m1,2]);reshape(mpo0{k,j},[2,2])];
W=reshape(W,[2,k,2,1]);
W=permute(W,[2,1,3,4]); 
mpo{j}=W;
end
end