I1=imread('cameraman.tif');
I2=imread('rice.png');
I1=double(I1);
I2=double(I2);
a=input('enter  key');
[u s v]=svd(I1);
s1=s+a*I2;
I3=u*s1*v';
figure
subplot(121)
imshow(uint8(I3));
title('water marked image');
s2=(s1-s)/0.2;
subplot(122);
imshow(uint8(s2));
title('Hidden image');
