function GryMat = Sig2Gry(raw, Winsize)
i = 0;
j = 0;

while(j + Winsize <= length(raw))
    sam = raw(j + 1:j + Winsize);
    [cfs, ~] = cwt(sam);
    imagesc(abs(cfs));
    F = getframe(gca);
    IMG = imresize(F.cdata, [28 28]);
    close
    GryMat{i + 1} = rgb2gray(IMG);
    i = i + 1;
    j = j + 1000;
end
end

