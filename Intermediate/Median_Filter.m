noisy = imnoise(img,'salt & pepper',0.02);
medianFiltered = medfilt2(noisy);
figure; imshow(medianFiltered); title('Median Filtered Image');
