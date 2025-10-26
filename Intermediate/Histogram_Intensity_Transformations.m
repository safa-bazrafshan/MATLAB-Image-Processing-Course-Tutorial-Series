clc; clear; close all;

% Read and convert image
img = imread('pout.tif');   % Built-in grayscale image
figure; imshow(img);
title('Original Image');

% Show histogram
figure; imhist(img);
title('Original Histogram');

% 1. Contrast Stretching
stretched = imadjust(img, [0.3 0.7], []);

% 2. Histogram Equalization
equalized = histeq(img);

% 3. Adaptive Histogram Equalization (CLAHE)
adaptiveEq = adapthisteq(img);

% Display results
figure;
subplot(2,2,1), imshow(img), title('Original');
subplot(2,2,2), imshow(stretched), title('Contrast Stretching');
subplot(2,2,3), imshow(equalized), title('Histogram Equalization');
subplot(2,2,4), imshow(adaptiveEq), title('Adaptive Histogram Equalization');

% Show histograms for comparison
figure;
subplot(2,2,1), imhist(img), title('Original');
subplot(2,2,2), imhist(stretched), title('Stretched');
subplot(2,2,3), imhist(equalized), title('Equalized');
subplot(2,2,4), imhist(adaptiveEq), title('Adaptive Equalized');
