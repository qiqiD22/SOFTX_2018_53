function result = GPU_dpdt(h,h2,h3,hx,hZ,hxz,hxx,hzz,q,qx,qz,qxz,P,pz,px,pxx,pzz,datahLz,delta,eta,zeta)
%the derivative of the spanwise flow rate by time . Use when we use the GPU
%version of runSimulation
% 

result=  (0.002976190476190476.*(-3.*(-144.*delta.*hZ.*P.*P + 144.*delta.*h.*px.*q + ...
                  P.*(280. - 7.*eta.*(12.*hx.*hx - 23.*h.*hxx + 64.*hZ.*hZ - 96.*h.*hzz) + ...
                  16.*delta.*(17.*h.*pz - 9.*hx.*q + 8.*h.*qx)) - 7.*eta*(52.*hx.*hZ.*q + ...
                  8.*h2.*(2.*pxx + 9.*pzz + 7.*qxz) - h.*(16.*hx.*px + 72.*hZ.*pz + 73.*hxz.*q + ...
                  13.*hZ.*qx + 43.*hx.*qz))) - 280.*h3.*hZ.*zeta + 280.*h3.*real(datahLz)))./(delta.*h2);
end