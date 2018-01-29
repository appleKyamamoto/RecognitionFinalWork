function create_codebook(imnames,codebookname)
run('/usr/local/class/object/MATLAB/vlfeat/vl_setup');
addpath('/usr/local/class/object/MATLAB/sift');

vec=[];
for i=1:numel(imnames)
    [pnt,desc] = sift_rand(im2double(rgb2gray(imread(imnames{i}))),'randn',2000);
    vec = [vec desc];
end
[codebook,idx]=vl_kmeans(vec,1000);
save(codebookname,'codebook');