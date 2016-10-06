A=imread('cameraman.tif');
figure
subplot(1,3,1);
imshow(A);
title('Original');
A=imnoise(A,'salt & pepper',0.02);
subplot(1,3,2);
imshow(A);
title('salt &pepper');
B=[1 1 1;1 1 1;1 1 1];
[a b]=size(A);
[c,d]=size(B);
R=zeros(a+(c-1),b+(d-1));
R(ceil(c/2):(end-floor(c/2)),ceil(d/2):(end-floor(d/2)))=A;
A=R;
l=1;
i=1;
j1=1;
P1=zeros(1,9);
for x=1:a
 for j=1:b
        T=A(x:x+c-1,j:j+d-1);
        D=im2double(T).*B;
        for k1=1:c
            for k2=1:d
                P1(j1)=D(k1,k2);
                j1=j1+1;
            end
        end
        j1=1;
        P1=sort(P1);
        x1=P1(1,5);
         P(i,l)=x1;
       l=l+1;
      end    
     l=1;
    i=i+1;
end
subplot(1,3,3);
imshow(uint8(P));
title('filter');