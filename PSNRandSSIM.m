close all;
clear all;
%%读取图像
img1=imread('C2.png');%原图像
img2=rgb2gray(imread('surf_C2_after.png'));%变换后的图像
[m,n]=size(img1);%%长度是m,宽度是n
img2=imresize(img2,[m,n],'nearest');%将变换后的图像转换为与原图像一样大
%imwrite(img2,'C2_warped.png')
% figure;
%imshowpair(img1,img2,'montage');

%计算psnr
[peaksnr, snr] = psnr(img2, img1);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);

%计算ssim
[ssimval, ssimmap] = ssim(img2,img1);

fprintf('The SSIM value is %0.4f.\n',ssimval);

figure, imshow(ssimmap,[]);
title(sprintf('ssim Index Map - Mean ssim Value is %0.4f',ssimval));