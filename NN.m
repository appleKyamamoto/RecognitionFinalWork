function NN(DB)
% DBは画像のベクトル集合 d*n
% pos,negは同じ枚数(n/2)
n=size(DB,1);

success=0;  %分類に成功した枚数
for i = 1:n
    simDB=[];
    for j = 1:n
        sim = sum( min( DB(j,:), DB(i,:)) ); % すべての画像との類似度算出
        simDB = [simDB sim];
    end 
    [A,B] = sort(simDB,'descend');
    if i <= n/2 && B(2) <= 100  %pos画像がpos画像に分類
        success = success + 1;
    elseif i > n/2 && B(2) > 100  %neg-neg分類
        success = success + 1;
    end
end
fprintf('認識率は%f\n',success/n);