function result = GPU_dqdt(h,h2,hx,hZ,hxz,hxx,hzz,q,qx,qz,qxx,qzz,P,pz,px,pxz,delta,eta,zeta,datahLx,corr)
%the derivative of the streamwise flow rate by time by using the simplified model. 
%Use when we use the GPU version of runSimulation
%  

result=  (11.666666666666666.*(-5.*h + (15.*q)./h2 + (0.012244897959183673.*corr.* ...
                  delta.^2.*hx.*q.^2.*(9.*hx.*q - 17.*h.*qx))./h2 + ...
                  (0.8571428571428571.*delta.*(-9.*hZ.*P.*q + q.*(8.*h.*pz - 9.*hx.*q + 17.*h.*qx) + ...
                  9.*h.*P.*qz))./h2 - (0.375.*eta.*(52.*hx.*hZ.*P + 64.*hx.^2.*q + 12.*hZ.^2.*q - ...
                  h.*(73.*hxz.*P + 43.*hZ.*px + 13.*hx.*pz + 96.*hxx.*q + 23.*hzz.*q + 72.*hx.*qx + 16.*hZ.*qz) + ...
                  8.*h2.*(7.*pxz + 9.*qxx + 2.*qzz)))./h2 + 5.*h.*hx.*zeta - 5.*h.*real(datahLx)))./ ...
                  (delta.*(-70. + corr.*delta.*hx.*q));
end