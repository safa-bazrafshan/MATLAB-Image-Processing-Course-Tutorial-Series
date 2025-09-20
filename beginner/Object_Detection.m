%% Object Detection Project

% Step 1: Read image and convert to grayscale
img = im2gray(imread('coins.png'));
figure; imshow(img); title('Original Grayscale Image');

% Step 2: Thresholding (automatic)
bw = imbinarize(img);
figure; imshow(bw); title('Binary Image');

% Step 3: Label connected components
[labeled, numObjects] = bwlabel(bw);
figure; imshow(label2rgb(labeled)); 
title(['Labeled Objects, Count = ', num2str(numObjects)]);

% Step 4: Measure properties of objects
stats = regionprops(labeled, 'Area', 'Centroid');

% Show centroids on image
figure; imshow(bw); title('Detected Objects with Centroids');
hold on;
for i = 1:numObjects
    plot(stats(i).Centroid(1), stats(i).Centroid(2), 'r*');
end
hold off;
