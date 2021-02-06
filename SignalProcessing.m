normal = norm;
abnormal = abno;
str = fix(rand() * 1000000);

fig = figure;
set(fig, 'Position', [0 0 1920 1080])

subplot(3,2,1)
plot(normal(str:str+999))
axis([0 1000 -0.07 0.07])
grid on
title("Normal")
xlabel("Data Points")
ylabel("Acceleration")
set(gca, 'fontsize', 16)

subplot(3,2,2)
plot(abnormal(str:str+999), 'r')
axis([0 1000 -0.07 0.07])
grid on
title("Fault")
xlabel("Data Points")
ylabel("Acceleration")
set(gca, 'fontsize', 16)

subplot(3,2,3)
no = Sig2Gry(normal(str:str+999));
set(gca, 'ytick', [])
xlabel("Data Points")
title("CWT Image of Normal Bearing")
set(gca, 'fontsize', 16)

subplot(3,2,4)
ab = Sig2Gry(abnormal(str:str+999));
set(gca, 'ytick', [])
xlabel("Data Points")
title("CWT Image of Fault Bearing")
set(gca, 'fontsize', 16)

subplot(3,2,5)
imshow(no)
title("Processed Image of Normal Bearing")
set(gca, 'fontsize', 16)

subplot(3,2,6)
imshow(ab)
title("Processed Image of Fault Bearing")
set(gca, 'fontsize', 16)