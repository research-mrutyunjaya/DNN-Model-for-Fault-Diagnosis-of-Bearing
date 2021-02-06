i = 1;

for j = 1:length(norm) / 1000
    Norm_IMG{i} = Sig2Gry(norm((j - 1) * 1000 + 1:j * 1000));
    i = i + 1
end

i = 1;

for j = 1:length(abno) / 1000
    Abno_IMG{i} = Sig2Gry(abno((j - 1) * 1000 + 1:j * 1000));
    i = i + 1
end