close all
clear
clc;
%%
%图像标准差
i=imread('C:\Users\10310\Desktop\important\A\A_this.png'); %载入真彩色图像
i=rgb2gray(i); %转换为灰度图
i=double(i);  %将uint8型转换为double型，否则不能计算统计量
variance=var(i(:)); %图像方差
standard=variance.^(1/2);
%%
%图像熵
I=imread('C:\Users\10310\Desktop\important\A\A_this.png');
[C,L]=size(I); %求图像的规格
Img_size=C*L; %图像像素点的总个数
G=256; %图像的灰度级
H_x=0;
nk=zeros(G,1);%产生一个G行1列的全零矩阵
for i=1:C
for j=1:L
Img_level=I(i,j)+1; %获取图像的灰度级
nk(Img_level)=nk(Img_level)+1; %统计每个灰度级像素的点数
end
end
for k=1:G  %循环
Ps(k)=nk(k)/Img_size; %计算每一个像素点的概率
if Ps(k)~=0; %如果像素点的概率不为零
H_x=-Ps(k)*log2(Ps(k))+H_x; %求熵值的公式
end
end
H_x;  %显示熵值
%%
%空间频率
I=rgb2gray(I);
SF=space_frequency(I);
%%
%平均梯度
Img=imread('C:\Users\10310\Desktop\important\A\A_this.png');
Img=rgb2gray(Img);
Img=double(Img);
[M,N]=size(Img);
gradval=zeros(M,N); %%% save the gradient value of single pixel
diffX=zeros(M,N);    %%% save the differential value of X orient
diffY=zeros(M,N);    %%% save the differential value of Y orient

tempX=zeros(M,N);
tempY=zeros(M,N);
tempX(1:M,1:(N-1))=Img(1:M,2:N);
tempY(1:(M-1),1:N)=Img(2:M,1:N);

diffX=Img-tempX;
diffY=Img-tempY;
diffX(1:M,N)=0;       %%% the boundery set to 0
diffY(M,1:N)=0;
diffX=diffX.*diffX;
diffY=diffY.*diffY;
AVEGRAD=sum(sum(diffX+diffY));
AVEGRAD=sqrt(AVEGRAD/2);
AVEGRAD=AVEGRAD/((M-1)*(N-1));%平均梯度
%%
%FFT变换域
%I=rgb2gray(I);
I=double(I);        
[M N]=size(I);          
fftI = fft2(I);   %进行二维离散傅里叶变换sfftI = fftshift(fftI);   %移位，直流分量移到图像中心
magnitude = abs(fftI);      %取模值
FI=0; 
for u=1:M    
    for v=1:N       
        FI=FI+sqrt(u*u+v*v)*magnitude(u,v);      %基于离散傅里叶变换的清晰度评价函数    
    end
end

