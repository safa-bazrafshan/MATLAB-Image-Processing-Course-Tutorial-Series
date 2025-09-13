% Read a grayscale image
img = rgb2gray(imread('peppers.png'));
figure; imshow(img); title('Original Image');

% Brightness: add a constant value
brightImg = img + 50;
figure; imshow(brightImg); title('Brighter Image');

% Brightness: subtract a constant value
darkImg = img - 50;
figure; imshow(darkImg); title('Darker Image');

% Contrast adjustment using imadjust
contrastImg = imadjust(img, [0.3 0.7], []);
figure; imshow(contrastImg); title('Contrast Adjusted Image');

% Histogram Equalization
histeqImg = histeq(img);
figure; imshow(histeqImg); title('Histogram Equalized Image');
