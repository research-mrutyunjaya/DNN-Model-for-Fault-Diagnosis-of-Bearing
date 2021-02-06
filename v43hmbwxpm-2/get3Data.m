Num = 1;

for i = 'A'%, 'B', 'C', 'D']
    for j = ['1', '2', '3']
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\v43hmbwxpm-2\3 Data collected from a bearing with outer race fault'
        dat = append('O-', i, '-', j, '.mat');
        tmp = load(dat);
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\'
        Fault2(Num).tab = Sig2Gry(tmp.Channel_1, 5000);
        Num = Num + 1;
    end
end
