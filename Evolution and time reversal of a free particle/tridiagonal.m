function [x] = tridiagonal(P,Q,R,b)
n=length(b);
x=zeros(1,n);
R=[0,R];
W=P;
for k=2:n
    t=R(k)/W(k-1);
    W(k)=W(k)-t*Q(k-1);
    b(k)=b(k)-t*b(k-1);
end
x(n)=b(n)/W(n);
for k=n-1:-1:1
    x(k)=(b(k)-Q(k)*x(k+1))/W(k);
end
end

