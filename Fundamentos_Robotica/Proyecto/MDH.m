function MDH = MDH(thetai,di,ai,alphai)
MDH =roz(thetai)*tran(0,0,di)*tran(ai,0,0)*rox(alphai);
end

