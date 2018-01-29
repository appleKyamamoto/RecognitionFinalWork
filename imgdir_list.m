function X=imgdir_list()
list=dir('imgdir2/');
name={};
for i=1:size(list)
if(strfind(list(i).name,'.jpg'));
im=strcat('imgdir2/',list(i).name);
name={name{:} im};
end
end
X=name;