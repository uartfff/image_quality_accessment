close all;
clear all;
%%��ȡͼ��
img1=imread('C2.png');%ԭͼ��
img2=rgb2gray(imread('surf_C2_after.png'));%�任���ͼ��
[m,n]=size(img1);%%������m,�����n
img2=imresize(img2,[m,n],'nearest');%���任���ͼ��ת��Ϊ��ԭͼ��һ����
%imwrite(img2,'C2_warped.png')
% figure;
%imshowpair(img1,img2,'montage');

%����psnr
[peaksnr, snr] = psnr(img2, img1);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);

%����ssim
[ssimval, ssimmap] = ssim(img2,img1);

fprintf('The SSIM value is %0.4f.\n',ssimval);

figure, imshow(ssimmap,[]);
title(sprintf('ssim Index Map - Mean ssim Value is %0.4f',ssimval));