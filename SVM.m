function X=SVM(training_data, testing_data, training_label,testing_label, mode)

% training_data 学習データ testing_data テストデータ
% n*d行列 n：データ数 d:ベクトルの次元数
% training_label 1:pos -1:neg n*1
% mode 'linear' or 'rbf'

if strcmp(mode,'linear')
    %線形
    model = fitcsvm(training_data, training_label,'KernelFunction','linear'); 
elseif strcmp(mode,'rbf')
    %非線形
    model = fitcsvm(training_data, training_label,'KernelFunction','rbf', 'KernelScale','auto');
end
%分類関数
[plabel, scores] = predict(model, testing_data);
X=numel(find(testing_label==plabel))/numel(testing_label);
