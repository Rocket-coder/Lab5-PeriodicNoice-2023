%ADDPERIODICNOICE;
%Name='cat1.png';
%Name='cat2.png';
%Name='cat3.png';
%Name='cat4.png';
%Name='cat5.png';
% Name='cat6.png';
Name='Rock1024.png';
A=imread(Name);
ABW=RGB2BW2(A);               % transform to BW if RGB
ShowImageBW3(ABW,['BW-image ',Name]);pause
F=fftshift(fft2(ABW));
%--------------------------------------------------------------------
x=300; % x-coordinate of the center of the spot
y=250; % y-coordinate of the center of the spot 
r=30;  % radius of the spot
n=200;  % number of noicy pixels
v=300; % noice level coefficient
printvector(['F(',int2str(x),',',int2str(y),')='],round(abs(F(x,y))));
NoiseData=['x=',int2str(x),'   y=',int2str(y),...
        '   r=',int2str(r),'   n=',int2str(n),'   v=',int2str(v) ];
D=AddSpot(F,x,y,r,n,v);
%--------------------------------------------------------------------
% imwrite(log(1+abs(F)),['Spect_1_',Name]);
% imwrite(log(1+abs(D)),['Spect_2_',Name]);
Show2Images(log(1+abs(F)),log(1+abs(D)), Name,NoiseData);
pause
DF=normalize(abs(ifft2(ifftshift(D))));
Show2ImagesBW(ABW,DF,Name,NoiseData);
imwrite(DF,['Noisy',Name]); 

