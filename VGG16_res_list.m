function X=VGG16_res_list(imnames)
%VGG-16 network
addpath('/usr/local/class/object/matconvnet');
addpath('/usr/local/class/object/matconvnet/matlab');
vl_setupnn;

net = load('imagenet-vgg-verydeep-16.mat'); % 高精度版のネットワーク

%imnamesはcell
%imlistには各画像のresがはいる
imlist = {};
for i=1:numel(imnames)
    im = imread(imnames{i});
    im_ = single(im); % note: 0-255 range
    im_ = imresize(im_, net.meta.normalization.imageSize(1:2));
    im_ = im_ - repmat(net.meta.normalization.averageImage,net.meta.normalization.imageSize(1:2));
    res = vl_simplenn(net, im_);
    imlist = {imlist{:} res};
end
%Xはn*d行列
X=imlist';