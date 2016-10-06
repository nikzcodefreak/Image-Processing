clc;clear all;
u=imread('cameraman.tif');
figure
subplot(221)
imshow(u)
title('original');
[m n]=size(u);
u=double(u);
u_xx1=u(:,[2:n,n])-2*u(:,1:n)+u(:,[1,1:n-1]);
u_yy1=u([2:m,m],:)-2*u(1:m,:)+u([1,1:m-1],:);
p=u_xx1+u_yy1;
p=uint8(p);
subplot(222)
imshow(p);
title('u_x_x+u_y_y');
subplot(223)
imshow(uint8(u_xx1));
title('u_x_x');
subplot(224)
imshow(uint8(u_yy1));
title('u_y_y');