Num = 1;

for i = 'A'%, 'B', 'C', 'D']
    for j = ['1', '2', '3']
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\v43hmbwxpm-2\4 Data collected from a bearing with ball fault'
        dat = append('B-', i, '-', j, '.mat');
        tmp = load(dat);
        cd 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing\'
        Fault3(Num).tab = Sig2Gry(tmp.Channel_1, 5000);
        Num = Num + 1;
    end
end
