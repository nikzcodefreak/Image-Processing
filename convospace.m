A=imread('cameraman.tif');
B=input('enter the filter');
f=input('enter the pixel overlap amount');
[a,b]=size(A);
[c,d]=size(B);
l=1;k=1;
A=double(A);
for i=1:f:a-c+1
    for j=1:f:b-d+1
        C=A(i:i+c-1,j:j+d-1);
        P(l,k)=sum(sum(C.*B));
       k=k+1;
    end
    k=1;
    l=l+1;
end
  imshow(uint8(P));