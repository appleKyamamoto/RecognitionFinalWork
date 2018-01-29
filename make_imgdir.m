function make_imgdir()
%read urllist type:cell
list=textread('urllist.txt','%s');

%webから画像をダウンロードしてディレクトリにいれる
OUTDIR='imgdir2';
%mkdir(OUTDIR);
for i=1:size(list,1)
  fname=strcat(OUTDIR,'/',num2str(i+400,'%04d'),'.jpg');
  websave(fname,list{i});
end

for i=1:size(list,1)
    img{i}=webread(list{i});
end

% ラーメン スパゲッティ お好み焼き