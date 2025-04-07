function MDH = MDH(thetai,di,ai,alphai)
MDH =tran(0,0,di)*roz(thetai)*tran(ai,0,0)*rox(alphai);
end

