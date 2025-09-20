% Read grayscale image
img = rgb2gray(imread('peppers.png'));
figure; imshow(img); title('Original Image');

% Blur using Gaussian filter
blurImg = imgaussfilt(img, 2);
figure; imshow(blurImg); title('Gaussian Blur');

% Sharpen the image
sharpenImg = imsharpen(img);
figure; imshow(sharpenImg); title('Sharpened Image');

% Edge detection: Sobel
edgeSobel = edge(img, 'Sobel');
figure; imshow(edgeSobel); title('Sobel Edge');

% Edge detection: Canny
edgeCanny = edge(img, 'Canny');
figure; imshow(edgeCanny); title('Canny Edge');
