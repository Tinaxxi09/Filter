%average filter 
clear;
clc;
img=imread('D:\matlab class\image\1327-w.jpg');
gr = rgb2gray(img);
filtered = average_filter(gr);
figure(1),imshow(uint8(filtered));
figure(2),imshow(gr);

