function [kx,kz,k2cut] = CPU_AliasingFilter(radius,N1,N2,M1,M2,k0x,k0z)
% determine the cut frequencies to avoid aliasing errors
%
%Begin Cut Filter
    m=round(radius*N1);
    n=round(radius*N2);
    k2cutCriterion=(m*k0x)^2+((-N2 + mod(n+N2,M2))*k0z)^2;    

 for m=[1:N1+1]
   for n=[1:M2]
      kx(m,n)=(m-1)*k0x;
      kz(m,n)=(-N2 + mod((n-1)+N2,M2))*k0z;
      k2(m,n)=kx(m,n)*kx(m,n)+kz(m,n)*kz(m,n);
      
      if(k2(m,n)>k2cutCriterion)
          k2cut(m,n)=0;
      else
          k2cut(m,n)=1;
      end
   end
 end
  k2cut=[k2cut; [conj(flipud(k2cut(2:N1,1))) conj(fliplr(flipud(k2cut(2:N1,2:M2))))]];
%Ende Cut Filter
end

