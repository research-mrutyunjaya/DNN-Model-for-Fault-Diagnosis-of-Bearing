Num = 1;

for i = ['B', 'C', 'D']
    for j = ['1', '2', '3']
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\v43hmbwxpm-2\1 Data collected from a healthy bearing\'
        dat = append('H-', i, '-', j, '.mat');
        tmp = load(dat);
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\'
        Normal(Num).tab = Sig2Gry(tmp.Channel_1, 5000);
        Num = Num + 1;
    end
end

Num = 1;

for i = ['B', 'C', 'D']
    for j = ['1', '2', '3']
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\v43hmbwxpm-2\2 Data collected from a bearing with inner race fault'
        dat = append('I-', i, '-', j, '.mat');
        tmp = load(dat);
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\'
        Fault1(Num).tab = Sig2Gry(tmp.Channel_1, 5000);
        Num = Num + 1;
    end
end

Num = 1;

for i = ['B', 'C', 'D']
    for j = ['1', '2', '3']
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\v43hmbwxpm-2\3 Data collected from a bearing with outer race fault'
        dat = append('O-', i, '-', j, '.mat');
        tmp = load(dat);
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\'
        Fault2(Num).tab = Sig2Gry(tmp.Channel_1, 5000);
        Num = Num + 1;
    end
end

Num = 1;

for i = ['B', 'C', 'D']
    for j = ['1', '2', '3']
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\v43hmbwxpm-2\4 Data collected from a bearing with ball fault'
        dat = append('B-', i, '-', j, '.mat');
        tmp = load(dat);
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\'
        Fault3(Num).tab = Sig2Gry(tmp.Channel_1, 5000);
        Num = Num + 1;
    end
end

Num = 1;

for i = ['B', 'C', 'D']
    for j = ['1', '2', '3']
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\v43hmbwxpm-2\5 Data collected from a bearing with a combination of faults'
        dat = append('C-', i, '-', j, '.mat');
        tmp = load(dat);
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\'
        Fault4(Num).tab = Sig2Gry(tmp.Channel_1, 5000);
        Num = Num + 1;
    end
end



k = 1;
for i = 1:9
    for j = 1:length(Normal(i).tab)
        val(k) = classify(net, Normal(i).tab{1, j})
        k = k + 1;
    end
end

AccuracyOfNo = length(find(val == 'Normal')) / length(val) * 100;

k = 1;
for i = 1:9
    for j = 1:length(Fault1(i).tab)
        val(k) = classify(net, Fault1(i).tab{1, j})
        k = k + 1;
    end
end

AccuracyOfF1 = length(find(val == 'F1')) / length(val) * 100;

k = 1;
for i = 1:9
    for j = 1:length(Fault2(i).tab)
        val(k) = classify(net, Fault2(i).tab{1, j})
        k = k + 1;
    end
end

AccuracyOfF2 = length(find(val == 'F2')) / length(val) * 100;

k = 1;
for i = 1:9
    for j = 1:length(Fault3(i).tab)
        val(k) = classify(net, Fault3(i).tab{1, j})
        k = k + 1;
    end
end

AccuracyOfF3 = length(find(val == 'F3')) / length(val) * 100;

k = 1;
for i = 1:9
    for j = 1:length(Fault4(i).tab)
        val(k) = classify(net, Fault4(i).tab{1, j})
        k = k + 1;
    end
end

AccuracyOfF4 = length(find(val == 'F4')) / length(val) * 100;