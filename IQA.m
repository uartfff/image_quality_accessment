close all
clear
clc;
%%
%ͼ���׼��
i=imread('C:\Users\10310\Desktop\important\A\A_this.png'); %�������ɫͼ��
i=rgb2gray(i); %ת��Ϊ�Ҷ�ͼ
i=double(i);  %��uint8��ת��Ϊdouble�ͣ������ܼ���ͳ����
variance=var(i(:)); %ͼ�񷽲�
standard=variance.^(1/2);
%%
%ͼ����
I=imread('C:\Users\10310\Desktop\important\A\A_this.png');
[C,L]=size(I); %��ͼ��Ĺ��
Img_size=C*L; %ͼ�����ص���ܸ���
G=256; %ͼ��ĻҶȼ�
H_x=0;
nk=zeros(G,1);%����һ��G��1�е�ȫ�����
for i=1:C
for j=1:L
Img_level=I(i,j)+1; %��ȡͼ��ĻҶȼ�
nk(Img_level)=nk(Img_level)+1; %ͳ��ÿ���Ҷȼ����صĵ���
end
end
for k=1:G  %ѭ��
Ps(k)=nk(k)/Img_size; %����ÿһ�����ص�ĸ���
if Ps(k)~=0; %������ص�ĸ��ʲ�Ϊ��
H_x=-Ps(k)*log2(Ps(k))+H_x; %����ֵ�Ĺ�ʽ
end
end
H_x;  %��ʾ��ֵ
%%
%�ռ�Ƶ��
I=rgb2gray(I);
SF=space_frequency(I);
%%
%ƽ���ݶ�
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
AVEGRAD=AVEGRAD/((M-1)*(N-1));%ƽ���ݶ�
%%
%FFT�任��
%I=rgb2gray(I);
I=double(I);        
[M N]=size(I);          
fftI = fft2(I);   %���ж�ά��ɢ����Ҷ�任sfftI = fftshift(fftI);   %��λ��ֱ�������Ƶ�ͼ������
magnitude = abs(fftI);      %ȡģֵ
FI=0; 
for u=1:M    
    for v=1:N       
        FI=FI+sqrt(u*u+v*v)*magnitude(u,v);      %������ɢ����Ҷ�任�����������ۺ���    
    end
end

