function B = PutCircle(B,x0,y0,r,v);
%For Periodic Filtering
%Origin at floor(N/2)+1
% x,y - absolute coordinates
N=size(B,1);
Ox=floor(N/2)+1; Oy=Ox; 
O=[x0,y0];
for x=x0-r:x0+r; 
for y=y0-r:y0+r;  
    P=[x,y]; if (norm(P-O)<=r); B(x,y)=v*B(x,y); end;    
end;
end; 
%------ Symmetric part -------------------------
x0=2*Ox-x0; y0=2*Oy-y0;
O=[x0,y0];
for x=x0-r:x0+r; 
for y=y0-r:y0+r;  
    P=[x,y]; if (norm(P-O)<=r); B(x,y)=v*B(x,y); end;    
end;
end;        
end

