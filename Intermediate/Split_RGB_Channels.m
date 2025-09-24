R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

figure;
subplot(1,3,1); imshow(R); title('Red Channel');
subplot(1,3,2); imshow(G); title('Green Channel');
subplot(1,3,3); imshow(B); title('Blue Channel');
