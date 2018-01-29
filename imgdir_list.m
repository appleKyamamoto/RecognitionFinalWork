function X=imgdir_list(dirname)
% dirname = 'imgdir/'
list=dir(dirname);
name={};
for i=1:size(list)
if(strfind(list(i).name,'.jpg'));
im=strcat(dirname,list(i).name);
name={name{:} im};
end
end
X=name;