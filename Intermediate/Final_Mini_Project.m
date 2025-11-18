% Final_Mini_Project.m
clc; clear; close all;

%% 1) Generate simple test image
H = 400; W = 600;
img = uint8(255 * ones(H,W,3));
[X,Y] = meshgrid(1:W, 1:H);

% --- Red Circle ---
cx = 150; cy = 120; r = 60;
mask1 = (X-cx).^2 + (Y-cy).^2 <= r^2;
img(:,:,1) = img(:,:,1).*uint8(~mask1) + uint8(mask1)*255;
img(:,:,2) = img(:,:,2).*uint8(~mask1);
img(:,:,3) = img(:,:,3).*uint8(~mask1);

% --- Green Square ---
x0 = 340; y0 = 90; w = 120;
mask2 = (X>=x0 & X<=x0+w & Y>=y0 & Y<=y0+w);
img(:,:,1) = img(:,:,1).*uint8(~mask2);
img(:,:,2) = img(:,:,2).*uint8(~mask2) + uint8(mask2)*255;
img(:,:,3) = img(:,:,3).*uint8(~mask2);

% --- Blue Triangle ---
triX = [250 330 290];
triY = [300 300 220];
mask3 = inpolygon(X, Y, triX, triY);
img(:,:,1) = img(:,:,1).*uint8(~mask3);
img(:,:,2) = img(:,:,2).*uint8(~mask3);
img(:,:,3) = img(:,:,3).*uint8(~mask3) + uint8(mask3)*255;

figure; imshow(img); title('Original Image');

%% 2) Binary mask for shapes
gray = rgb2gray(img);
bw = gray < 250;     % threshold
bw = bwareaopen(bw, 200);

%% 3) Label objects
[L, num] = bwlabel(bw);
stats = regionprops(L, 'Area','Perimeter','Centroid','BoundingBox','PixelIdxList');

%% 4) Analyze each object
figure; imshow(img); hold on; title('Detected Objects');

colors = {'Red','Green','Blue'};

for k = 1:num

    pix = stats(k).PixelIdxList;

    % Shape detection
    A = stats(k).Area;
    P = stats(k).Perimeter;
    circ = (4*pi*A)/(P^2);

    if circ > 0.80
        shape = 'Circle';
    elseif circ > 0.60
        shape = 'Square';
    else
        shape = 'Triangle';
    end

    % Color detection
    R = img(:,:,1); G = img(:,:,2); B = img(:,:,3);
    meanR = mean(R(pix));
    meanG = mean(G(pix));
    meanB = mean(B(pix));

    [~, idx] = max([meanR meanG meanB]);
    colorName = colors{idx};

    % Draw
    bbox = stats(k).BoundingBox;
    ctr = stats(k).Centroid;
    rectangle('Position', bbox, 'EdgeColor','y', 'LineWidth', 1);
    text(ctr(1), ctr(2), sprintf('%s %s', colorName, shape), ...
        'Color','white', 'FontWeight','bold','FontSize',12, ...
        'HorizontalAlignment','center', 'BackgroundColor','black');

end

hold off;

fprintf('\nFinished! Detected %d object(s).\n', num);
