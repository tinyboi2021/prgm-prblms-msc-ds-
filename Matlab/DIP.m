img=imread("D:\catstare.jpg");
negative_img = 255 - img;  % Compute the negative
img_gray = rgb2gray(img);  % Convert to grayscale (if needed)

img_double = im2double(img_gray);  % Convert to double for calculations
c = 1;  % Scaling factor (adjust as needed)
log_transformed = c * log(1 + img_double);  % Apply log transformation
inv_log_transformed = exp(log_transformed) - 1;  % Apply inverse log transformation
figure;  % Create a new figure window

% Display original image on the left
subplot(2,2,1);  
imshow(img);  
title('Orginal');

% Display negative image on the right
subplot(2,2,2);  
imshow(negative_img);  
title('negative');

subplot(2,2,3);  
imshow(log_transformed);  
title('log transformation');

subplot(2,2,4);  
imshow(inv_log_transformed);  
title('negative log transformation');

gamma = 0.5;  % Set gamma value (Try values <1 for brightening, >1 for darkening)
gamma_transformed = img_double .^ gamma;  % Apply gamma correction

figure;
subplot(1,2,1), imshow(img_gray), title('Original Image');
subplot(1,2,2), imshow(gamma_transformed), title(['Gamma Corrected (\gamma = ', num2str(gamma), ')']);

OrgHist=imhist(img_gray);

figure;
subplot(1,2,1), imshow(img_gray), title('Grayscale Image');
subplot(1,2,2), imhist(img_gray), title('Histogram');  % Display histogram

stretched_img = imadjust(img_gray, stretchlim(img_gray, [0.01 0.99]), []); 

figure;
subplot(1,2,1), imshow(img_gray), title('Original Image'); %contrast stretching
subplot(1,2,2), imshow(stretched_img), title('Contrast Stretched Image');

equalized_img = histeq(img_gray);  % Apply histogram equalization

figure;
subplot(1,2,1), imshow(img_gray), title('Original Image');
subplot(1,2,2), imshow(equalized_img), title('Histogram Equalized Image');