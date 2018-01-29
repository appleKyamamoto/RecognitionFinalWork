function X=Alex_res_list(imnames)
addpath('/usr/local/class/object/matconvnet');
addpath('/usr/local/class/object/matconvnet/matlab');
vl_setupnn;

net = load('imagenet-caffe-alex.mat');


%imnamesはcell
%imlistには各画像のresがはいる
imlist = {};
for i=1:numel(imnames)
    im = imread(imnames{i});
    im_ = single(im); % note: 0-255 range
    im_ = imresize(im_, net.meta.normalization.imageSize(1:2));
    im_ = im_ - net.meta.normalization.averageImage;
    res = vl_simplenn(net, im_);
    imlist = {imlist{:} res};
end
%Xはn*d行列
X=imlist';