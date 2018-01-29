function X = create_bovw(idx,codebook)
% idx = [pos neg] positive画像のインデックスとnegative画像のインデックス
% codebookには読み込んだコードブックを渡す
addpath('/usr/local/class/object/MATLAB/sift');
addpath('.');

load('all_imagenames_list');

bovw=zeros(1000,200);
for j = 1:numel(idx)
    I=im2double(rgb2gray(imread(allimages{idx(j)})));
    [pnt,desc] = sift_rand(I,'randn',2000);
    for i=1:size(pnt,2)
        index=high_search(codebook,desc(:,i));
        bovw(index,j)=bovw(index,j)+1;
    end
end
X =bovw;