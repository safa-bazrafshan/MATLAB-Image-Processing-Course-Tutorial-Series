clc; clear; close all;

% Step 1: Read and preprocess image
img = imread('coins.png');
gray = im2gray(img);
figure; imshow(gray); title('Original Grayscale Image');

% Step 2: Global thresholding
bw = imbinarize(gray);
figure; imshow(bw); title('Global Thresholding');

% Step 3: Watershed segmentation
% Compute gradient magnitude
gmag = imgradient(gray);
L = watershed(gmag);

% Label and display
rgbLabel = label2rgb(L);
figure; imshow(rgbLabel); title('Watershed Segmentation');

% Step 4: Region-based segmentation (example using active contour)
mask = false(size(gray));
mask(50:end-50,50:end-50) = true;

bwRegion = activecontour(gray, mask, 200);
figure;
imshow(bwRegion);
title('Region-based Segmentation (Active Contour)');

% Step 5: Compare results
figure;
subplot(1,3,1), imshow(bw), title('Thresholding');
subplot(1,3,2), imshow(rgbLabel), title('Watershed');
subplot(1,3,3), imshow(bwRegion), title('Region-Based');
