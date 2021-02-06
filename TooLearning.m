%%
clc; 
clear all;

cd('D:\Dropbox\Experiment\UgintTest\test4\Data')
 
load('Tooldata.mat')
 
 
t=wear(:,1);
wear(:,1)=[];  normal(:,1)=[];
% This section will make a image which is analyzed scalogram
% sacleogram is made from continuous wavelet transform

[tlim,dimage]=timeForScalogram(t,0.1);
cd 'D:\Dropbox\Experiment\UgintTest\Test3\Deeplearning\Data3\Wear'
Beraingkurtogram(wear,tlim,dimage);
BeraingScalogram(wear,tlim,dimage);
BeraingScalogram2(wear,tlim,dimage);
BeraingSpectogram(wear,tlim,dimage);
ImageDatanSavingK

cd 'D:\Dropbox\Experiment\UgintTest\Test3\Deeplearning\Data3\Normal'
Beraingkurtogram(normal,tlim,dimage);
cd 'D:\Dropbox\Experiment\UgintTest\Test3\Deeplearning\Data3\Failure'
Beraingkurtogram(fail,tlim,dimage);

%% Spectogram
mkdir Normal
mkdir Wear

[tlim,dimage]=timeForScalogram(t,0.1);
cd 'E:\�� ����\Dropbox\Experiment\UgintTest\test4\Data\Normal'
cd 'D:\Dropbox\Experiment\UgintTest\test4\Data\Normal'
BeraingScalogram(normal,tlim,dimage);
cd 'D:\Dropbox\Experiment\UgintTest\test4\DataWear'
BeraingScalogram(wear,tlim,dimage);
 
%% Data loading for Deep Lerniang 
% Data property is images file which saved as folder name
folder = 'E:\�� ����\Dropbox\Experiment\UgintTest\test4\Data'
 ds=imageDatastore(folder,'InCludeSubfolders',true,'FileExtensions','.jpg','LabelSource','foldernames')
 % ���� �������� jpg ������ ������ ������ �������� Label�Ͽ� �����͸� ������
 numTrainingFiles=0.7; % Training ����
 [imdsTrain,imdsTest]=splitEachLabel(ds,numTrainingFiles,'randomize');
 disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
 disp('Image data loading is completed')
 disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')

 %% Compose layer
W=64; H = 64;

layers = [
    imageInputLayer([W H 3],"Name","imageinput")
    convolution2dLayer([12 12],10,"Name","conv_1","Padding",[1 1 1 1],"Stride",[3 3])
    batchNormalizationLayer("Name","batchnorm_1")
    reluLayer("Name","relu_1")
    maxPooling2dLayer([2 2],"Name","maxpool_1")
    convolution2dLayer([8 8],32,"Name","conv_2","Stride",[2 2])
    batchNormalizationLayer("Name","batchnorm_2")
    reluLayer("Name","relu_2")
    maxPooling2dLayer([2 2],"Name","maxpool_2")
    convolution2dLayer([3 3],64,"Name","conv_3","Stride",[2 2])
    batchNormalizationLayer("Name","batchnorm_3")
    reluLayer("Name","relu_3")
    convolution2dLayer([3 3],156,"Name","conv_4","Padding","same")
    batchNormalizationLayer("Name","batchnorm_4")
    reluLayer("Name","relu_4")
    fullyConnectedLayer(100,"Name","fc_1")
    fullyConnectedLayer(2,"Name","fc_2")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];
 disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
 disp('Layer composition is  completed')
 disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
%% set up training options
% deep learning option ����
options = trainingOptions('sgdm',...
    'LearnRateSchedule','piecewise',...
    'MaxEpochs',30,'ValidationData',imdsTest,...
    'MiniBatchSize',6, 'Verbose',false,...
    'InitialLearnRate',1e-4,...
    'Plots','training-progress')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
 disp('training options is set')
 disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
  %% Train network
[net,info] = trainNetwork(imdsTrain,layers,options);
save('data.mat')
%%
%imdsTest�� 
conf=classify(net,imdsTest);

sumconf=numel(conf);


% plotconfusion(imdsTest.Labels,conf)


[nconf,nnames]=confusionmat(imdsTest.Labels,conf);
nconf2=floor(nconf/sumconf*100);
%  names={'Ball defect','Flaking','Normal','Smearing'};
 names={'Normal','Wear'};
%  heatmap(conf)
 
figure
h=heatmap(names,names,nconf2)
% h=heatmap(nnames,nnames,nconf);
% heatmap�� �Ӽ��� h �ε����� ������ �� ����
h.XLabel='Prediction[%]'; 
h.YLabel='True[%]';
h.ColorScaling ='scaledcolumns'; % �� ������ ���� ����ȭ
h.ColorScaling ='scaledrows';% �� �࿡�� ���� ����ȭ
saveas(gcf,'Confusion.jpg')
