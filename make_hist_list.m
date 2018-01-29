function X=make_hist_list(imnames)
H=[];
for i=1:numel(imnames)
    X = imread(imnames{i});
    RED=X(:,:,1); GREEN=X(:,:,2); BLUE=X(:,:,3);
    X64=floor(double(RED)/64) *4*4 + floor(double(GREEN)/64) *4 + floor(double(BLUE)/64);
    X64_vec=reshape(X64,1,numel(X64));
    h=histc(X64_vec,[0:63]);
    H=[H; h];
end
X=H;