function FFCV(data)
%dataは[]配列を使う
%dataはn*d n:データの数 d:次元
x=size(data,1)/2;
data_pos=data(1:x,:);
data_neg=data(x+1:size(data,1),:);

cv=5;
n_pos=size(data_pos,1);
n_neg=size(data_neg,1);
% idx_pos,negに1:nまでのランダムなインデックスを
% cv * n/cv 行列にして格納 (１００枚なら 5*20)
idx_pos=reshape(randperm(n_pos),cv,n_pos/cv);
idx_neg=reshape(randperm(n_neg),cv,n_neg/cv);
accuracy=[];
% idx(i,:)は評価データ
% それ以外は学習データ
for i=1:cv
  eval_pos =data_pos(idx_pos(i,:),:);
  train_pos=data_pos(idx_pos(find([1:cv]~=i),:),:);
  eval_neg =data_neg(idx_neg(i,:),:);
  train_neg=data_neg(idx_neg(find([1:cv]~=i),:),:);
  eval=[eval_pos; eval_neg];
  train=[train_pos; train_neg];
  eval_label =[ones(size(eval_pos,1),1); ones(size(eval_neg,1),1)*(-1)];
  train_label=[ones(size(train_pos,1),1); ones(size(train_neg,1),1)*(-1)];
  ac=SVM(train,eval,train_label,eval_label,'linear');
  accuracy=[accuracy ac];
end
fprintf('accuracy: %f\n',mean(accuracy))