function GryMat = Sig2Gry(Data)
[cfs, ~] = cwt(Data);
imagesc(abs(cfs));
F = getframe(gca);
IMG = imresize(F.cdata, [28 28]);
close
GryMat = rgb2gray(IMG);
end

