function ex2()
list=imgdir_list('imgdir2/');
neglist=imgdir_list('/usr/local/class/object/bgimg/');
pos={};
neg={};
for i=1:50
    I=imread(list{i});
    pos={pos{:} pos};
end
for i=1:500
    I=imread(neglist{i});
    neg={neg{:} neg};
end