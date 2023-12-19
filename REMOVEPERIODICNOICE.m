%REMOVEPERIODICNOICE;
% A=imread('Noisycat6.png');
A=imread('NoisyRock1024.png');
F=fftshift(fft2(A));
ShowImage(log(1+abs(F)),'DFT'); pause
%-----------------------------------------
N=size(A,1);
B=ones(N);
% x0=168; y0=325; r=5;v=0;    B=PutCircle(B,x0,y0,r,v);
x0=300; y0=250; r=30; v=0.0;    B=PutCircle(B,x0,y0,r,v);
%-----------------------------------------
ShowImageBW(1-B,'Mask'); pause
D=F-F.*(1-B);      %Denoice
Show2Images(log(1+abs(F)),log(1+abs(D)),...
           'Original','Filtered');      
pause
DF=normalize(abs(ifft2(ifftshift(D))));
Show2ImagesBW(A,DF,'With Noice','filtered');
imwrite(DF,'RockFiltered.png');
C=imread('Rock1024.png');
Show2ImagesBW(C,DF,'Original','filtered');
