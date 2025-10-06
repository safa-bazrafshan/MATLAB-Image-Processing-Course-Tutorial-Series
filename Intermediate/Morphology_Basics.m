clc; clear; close all;

% Read and prepare image
img = imread('coins.png');     % Built-in MATLAB sample
gray = im2gray(img);
bw = imbinarize(gray);

% Display original
figure;
imshow(bw);
title('Original Binary Image');

% Define structuring element
se = strel('disk', 5);

% Erosion
eroded = imerode(bw, se);

% Dilation
dilated = imdilate(bw, se);

% Opening and Closing
opened = imopen(bw, se);
closed = imclose(bw, se);

% Display all results
figure;
subplot(2,3,1), imshow(bw), title('Original');
subplot(2,3,2), imshow(eroded), title('Erosion');
subplot(2,3,3), imshow(dilated), title('Dilation');
subplot(2,3,4), imshow(opened), title('Opening');
subplot(2,3,5), imshow(closed), title('Closing');
subplot(2,3,6), imshow(imabsdiff(bw, closed)), title('Difference (Example)');
