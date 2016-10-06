clear all;
A=imread('cameraman.tif');
figure
subplot(1,2,1);
imshow(A);
title('Original');
B=[0 1 0;1 -4 1;0 1 0];
[a b]=size(A);
[c,d]=size(B);
R=zeros(a+(c-1),b+(d-1));
R(ceil(c/2):(end-floor(c/2)),ceil(d/2):(end-floor(d/2)))=A;
A=R;
l=1;
i=1;
for x=1:a  
   for j=1:b
        T=A(x:x+c-1,j:j+d-1);
        D=im2double(T).*B;
       P(i,l)= sum(sum(D));
       l=l+1;
    end
    l=1;
    i=i+1;
end
subplot(1,2,2);
imshow(uint8(P));
title('laplacian');
