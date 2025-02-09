img1 = imread('D:/catmeme/images.jpg');
resized_img1=imresize(img1,[400,400])
img2 = imread('D:/catmeme/rRFhx5A.jpeg');
resized_img2=imresize(img2,[400,400])

% Convert to grayscale (if needed)
img1_gray = rgb2gray(resized_img1);
img2_gray = rgb2gray(resized_img2);

figure;
subplot(1,2,1), imshow(img1_gray), title('image 1 Grayscale Image');
subplot(1,2,2), imshow(img2_gray), title('image 2 Grayscale Image');

% Compute correlation coefficient
correlation_value = corr2(img1_gray, img2_gray);

disp(['Correlation Coefficient: ', num2str(correlation_value)]);
