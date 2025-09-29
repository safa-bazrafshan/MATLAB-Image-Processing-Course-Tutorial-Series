img = imread('cameraman.tif');
h = fspecial('average', [5 5]);
blurred = imfilter(img, h);
figure; imshow(blurred); title('Blurred Image');
