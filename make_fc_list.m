function X = make_fc_list(datalist,n)
%fc8 res(end-5).x 
%fc7 res(end-3).x 
%fc6 res(end-1).x 

%datalist : n*d
d=[];
for i=1:size(datalist,1)
    dcnnf = squeeze(datalist{i}(end-n).x);
    dcnnf=dcnnf/norm(dcnnf);
    d=[d dcnnf];
end
X = d';