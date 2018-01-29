function ex1()
%ラーメン パスタ お好み焼き
% ヒストグラムと最近傍分類(NN)
histgram=make_hist_list(allimages);
diff_hist=histgram(1:200,:);
easy_hist=[histgram(1:100,:); histgram(201:300,:)];
fprintf('easy combination by NN\n');
NN(diff_hist);
fprintf('difficult combination by NN\n');
NN(easy_hist);

%BoF SVM 'rbf'
%全画像codebook&全画像BOVW?
load('difficultcombination.mat');
load('easycombination.mat');
create_codebook(difficult,'difficult_codebook.mat');
create_codebook(easy,'easy_codebook.mat');
create_bovw([1:200],load('difficult_codebook.mat'));
create_bovw([1:100 201:300],load('easy_codebook.mat'));
%DCNN SVM 'linear'
load('easycombination.mat');
load('difficultcombination.mat');
easyAlex=Alex_res_list(easy);
diffAlex=Alex_res_list(difficult);
easyVGG16=VGG16_res_list(easy);
diffVGG16=VGG16_res_list(difficult);
fprintf('easy combination by Alex\n');
FFCV(make_fc_list(easyAlex,3));
fprintf('difficult combination by Alex\n');
FFCV(make_fc_list(diffAlex,3));
fprintf('easy combination by VGG-16\n');
FFCV(make_fc_list(easyVGG16,3));
fprintf('difficult combination by VGG-16\n');
FFCV(make_fc_list(diffVGG16,3));