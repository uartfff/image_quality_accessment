%图像质量评价指标——空间频率
function SF=space_frequency(X) %X为uint8类型
[m n]=size(X);
X=double(X);                      
RF=0;
CF=0;

for fi=1:m
    for fj=2:n
        RF=RF+(X(fi,fj)-X(fi,fj-1)).^2;
    end
end

RF=RF/(m*n);

for r=1:n
    for s=2:m
        CF=CF+(X(s,r)-X(s-1,r)).^2;
    end
end

CF=CF/(m*n);

SF=sqrt(RF+CF)