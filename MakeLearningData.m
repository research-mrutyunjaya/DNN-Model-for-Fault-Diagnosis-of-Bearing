cd v43hmbwxpm-2\
get1Data

cd v43hmbwxpm-2\
get2Data

cd v43hmbwxpm-2\
get3Data

cd v43hmbwxpm-2\
get4Data

cd v43hmbwxpm-2\
get5Data


i = 1;

cd Normal\
for No = Normal
    for tmp = No.tab
        imwrite(tmp{:}, append(string(i), '.jpg'));
        i = i + 1;
    end
end
cd ..


i = 1;

cd F1\
for F1 = Fault1
    for tmp = F1.tab
        imwrite(tmp{:}, append(string(i), '.jpg'));
        i = i + 1;
    end
end
cd ..


i = 1;

cd F2\
for F2 = Fault2
    for tmp = F2.tab
        imwrite(tmp{:}, append(string(i), '.jpg'));
        i = i + 1;
    end
end
cd ..


i = 1;

cd F3\
for F3 = Fault3
    for tmp = F3.tab
        imwrite(tmp{:}, append(string(i), '.jpg'));
        i = i + 1;
    end
end
cd ..


i = 1;

cd F4\
for F4 = Fault4
    for tmp = F4.tab
        imwrite(tmp{:}, append(string(i), '.jpg'));
        i = i + 1;
    end
end
cd ..
