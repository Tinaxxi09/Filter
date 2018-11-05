%%Gaussian filter
clear;
clc;
R = input ('Input size of Gaussian mask :');
sigma = input ('Input sigma :');


%// Generate Gaussian mask
ind = -floor(R/2) : floor(R/2);
[X Y] = meshgrid(ind, ind);
h = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));
h = h / sum(h(:));

%// Convert filter into a column vector
h = h(:);

%// Filter our image
I = imread('D:\matlab class\image\1327-w.jpg');
gr = rgb2gray(I);
Im = im2double(gr);
I_pad = padarray(Im,[floor(R/2) floor(R/2)]);
C = im2col(I_pad, [R R], 'sliding');
C_filter = sum(bsxfun(@times, C, h), 1);
out = col2im(C_filter, [R R], size(I_pad), 'sliding');
imshow(out)