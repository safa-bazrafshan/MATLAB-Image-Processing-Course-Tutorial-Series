clc; clear; close all;

% Step 1: Read and prepare the image
img = imread('coins.png');    % You can replace this with your own image
gray = im2gray(img);

% Step 2: Edge detection
edges = edge(gray, 'Canny');  % Using Canny for precise edges

% Step 3: Label connected components
[labeled, numObjects] = bwlabel(edges);

% Step 4: Extract geometric features
stats = regionprops(labeled, 'Area', 'Perimeter', 'Centroid', 'BoundingBox');

% Step 5: Display results
figure;
imshow(gray); title('Detected Objects with Features');
hold on;

for k = 1:numObjects
    rectangle('Position', stats(k).BoundingBox, 'EdgeColor', 'y', 'LineWidth', 1);
    plot(stats(k).Centroid(1), stats(k).Centroid(2), 'r*');
end
hold off;

% Step 6: Print object info
disp('Object Features:');
for k = 1:numObjects
    fprintf('Object %d: Area = %.2f, Perimeter = %.2f\n', ...
        k, stats(k).Area, stats(k).Perimeter);
end
