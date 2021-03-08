%教師データの読み込み
load("data\data.mat")
%未学習のネットワークの読み込み
load("layers.mat")

%インデックスを分割
[trainInd,valInd,testInd] = dividerand(length(X));
%データの分割
Xtrain = X(trainInd);   Xval = X(valInd);   Xtest = X(testInd);
Ytrain = Y(trainInd);   Yval = Y(valInd);   Ytest = Y(testInd);

%設定と学習
miniBatchSize = 27;
options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'MaxEpochs',100, ...
    'MiniBatchSize',miniBatchSize, ...
    'ValidationData',{Xval,Yval}, ...
    'GradientThreshold',2, ...
    'Shuffle','every-epoch', ...
    'Verbose',false, ...
    'Plots','training-progress');
net = trainNetwork(Xtrain,Ytrain,layers_1,options);

%ネットワークの保存
save("net\net","net");