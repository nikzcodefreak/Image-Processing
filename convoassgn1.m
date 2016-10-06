clear all;
A=imread('cameraman.tif');
I_1=A;
figure
subplot(1,4,1);
imshow(A);
title('Original');
n1=input('Enter B Matrix row')
n2=input('Enter B Matrix column');
B=(1/(n1*n2))*(ones(n1,n2));
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
subplot(1,4,2);
imshow(uint8(P));
title('Convolution')
subplot(1,4,3);
I_2=I_1-uint8(P);
imshow(uint8(I_2));
title('Edge');
I_3=I_2+I_1;
subplot(1,4,4);
imshow(I_3);
title('Edge enhanced');  