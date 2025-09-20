% Read a color image (RGB)
rgbImage = imread('peppers.png');
imshow(rgbImage);
title('RGB Image');

% Read a grayscale image
grayImage = rgb2gray(rgbImage);
figure;
imshow(grayImage);
title('Grayscale Image');

% Check image sizes
disp('RGB Image size:');
disp(size(rgbImage));
disp('Grayscale Image size:');
disp(size(grayImage));