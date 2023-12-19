function D=AddSpot(A,a,b,r,n,v)
D=A;
seed=rng;
%----------- Pepper ------------------------
R=2*r+1; 
X=randi(R,[1,n]); % Random Coordinates X
Y=randi(R,[1,n]); % Random Coordinates Y
V=randi(v,[1,n]); % Random Brightness
for p=1:n;        % 
        if norm([X(p)-r,Y(p)-r])<r;
           D(a-r+X(p),b-r+Y(p))=V(p)*A(a-r+X(p),b-r+Y(p));
        end;   
end;
end


