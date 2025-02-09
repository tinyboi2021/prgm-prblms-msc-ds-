img1 = imread('D:/catmeme/images.jpg');
resized_img1=imresize(img1,[400,400])
img2 = imread('D:/catmeme/rRFhx5A.jpeg');
resized_img2=imresize(img2,[400,400])

% Convert to grayscale (if needed)
img1_gray = rgb2gray(resized_img1);
img2_gray = rgb2gray(resized_img2);

kernel = [1 2 1; 0 0 0; -1 -2 -1];

% Apply correlation using imfilter
correlated_img = imfilter(img1_gray, kernel, 'same');

kernel_flipped = rot90(kernel, 2);  % Rotate 180°
convolved_img = imfilter(img1_gray, kernel_flipped, 'same');

figure;
subplot(1,2,1), imshow(correlated_img), title('correlation result');
subplot(1,2,2), imshow(convolved_img), title('convolution result');