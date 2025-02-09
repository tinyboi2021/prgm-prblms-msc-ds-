img = imread('D:/catmeme/images.jpg');
img_gray = rgb2gray(img);  % Convert to grayscale if needed

% Create a 3x3 averaging filter
box_kernel = fspecial('average', [3, 3]);

% Apply the filter using imfilter
smoothed_img = imfilter(img_gray, box_kernel, 'same');

% Display results
figure;
subplot(1,2,1), imshow(img_gray), title('Original Image');
subplot(1,2,2), imshow(smoothed_img), title('Box Filtered Image');

gaussian_kernel = fspecial('gaussian', [5,5], 1);

% Apply Gaussian smoothing
gaussian_smoothed = imfilter(img_gray, gaussian_kernel, 'same');

% Display results
figure;
subplot(1,2,1), imshow(img_gray), title('Original Image');
subplot(1,2,2), imshow(gaussian_smoothed), title('Gaussian Filtered Image');
