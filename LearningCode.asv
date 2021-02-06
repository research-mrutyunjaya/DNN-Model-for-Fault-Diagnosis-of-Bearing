%% Data loading for Deep Lerniang 
% Data property is images file which saved as folder name
folder = 'D:\Line Center\DNN-Model-for-Fault-Diagnosis-of-Bearing'
ds=imageDatastore(folder,'InCludeSubfolders',true,'FileExtensions','.jpg','LabelSource','foldernames')
 % 하위 폴더안의 jpg 형식의 파일을 폴더를 기준으로 Label하여 데이터를 구성함
numTrainingFiles=0.7; % Training 비율
[imdsTrain,imdsTest]=splitEachLabel(ds,numTrainingFiles,'randomize');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('Image data loading is completed')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')

W = 28; H = 28;

layers = [
    imageInputLayer([W H 1],"Name","imageinput")
    convolution2dLayer([5 5],32,"Name","conv_1","Padding",[1 1 1 1],"Stride",[3 3])
    %batchNormalizationLayer("Name","batchnorm_1")
    %reluLayer("Name","relu_1")
    maxPooling2dLayer([2 2],"Name","maxpool_1")
    convolution2dLayer([3 3],64,"Name","conv_2","Stride",[2 2])
    %batchNormalizationLayer("Name","batchnorm_2")
    %reluLayer("Name","relu_2")
    maxPooling2dLayer([2 2],"Name","maxpool_2")
    %convolution2dLayer([3 3],64,"Name","conv_3","Stride",[2 2])
    %batchNormalizationLayer("Name","batchnorm_3")
    %reluLayer("Name","relu_3")
    %convolution2dLayer([3 3],156,"Name","conv_4","Padding","same")
    %batchNormalizationLayer("Name","batchnorm_4")
    %reluLayer("Name","relu_4")
    fullyConnectedLayer(256,"Name","fc_1")
    fullyConnectedLayer(5,"Name","fc_2")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('Layer composition is  completed')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
%% set up training options
% deep learning option 설정
options = trainingOptions('sgdm', 'LearnRateSchedule', 'piecewise', 'InitialLearnRate', 0.001, 'MaxEpochs', 30, 'Shuffle', 'every-epoch', 'ValidationData', imdsTest, 'ValidationFrequency', 30, 'Verbose', false, 'ExecutionEnvironment', 'gpu', 'Plots', 'training-progress', 'MiniBatchSize', 30); 
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('training options is set')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
%% Train network
[net,info] = trainNetwork(imdsTrain,layers,options);