function X = high_search(DB,newD)
%size(DB)=p n p:次元 n:画像枚数
%size(newD)=p 1
n = size(DB,2);
[m X] = min( sum( ( ( DB - repmat(newD,1,n) ) .^ 2 )' ) );