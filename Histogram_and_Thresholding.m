%% Histogram & Thresholding in MATLAB

% Read image and convert to grayscale (compatible with all image types)
img = im2gray(imread('coins.png'));
figure; imshow(img); title('Original Grayscale Image');

% Show histogram
figure; imhist(img); title('Histogram of Image');

% Simple thresholding (manual value)
T = 100;
binaryImg = img > T;
figure; imshow(binaryImg); title(['Thresholded at T = ', num2str(T)]);

% Automatic thresholding using imbinarize (Otsu method)
autoBinary = imbinarize(img);
figure; imshow(autoBinary); title('Automatic Thresholding (Otsu Method)');
