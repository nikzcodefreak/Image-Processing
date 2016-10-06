u0=imread('cameraman.tif');
% L=del2(u);
dt=1;
T=250;
u0=gpuArray(u0);
u0=im2double(u0);
u=u0;
for t=0:dt:T
    u=u+dt*del2(u);
    subplot(121);imshow((u0));title('original');
    subplot(122);imshow((u));title(['Time t=',num2str(t)]);
    colormap gray;drawnow;
end; 
    