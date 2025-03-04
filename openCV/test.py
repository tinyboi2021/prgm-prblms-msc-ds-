import cv2
import numpy as np
import matplotlib.pyplot as plt

# Load the image
img = cv2.imread(r"C:\xampp\htdocs\prgm-prblms-msc-ds-\openCV\images\images.jpg")
img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)  # Convert BGR to RGB
img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)  # Convert to grayscale

# Compute the negative
negative_img = 255 - img_rgb

# Log transformation
img_double = img_gray.astype(np.float64) / 255.0
c = 1  # Scaling factor
log_transformed = c * np.log(1 + img_double)
inv_log_transformed = np.exp(log_transformed) - 1

# Display images
fig, axs = plt.subplots(2, 2, figsize=(10, 10))
axs[0, 0].imshow(img_rgb)
axs[0, 0].set_title('Original')
axs[0, 0].axis('off')

axs[0, 1].imshow(negative_img)
axs[0, 1].set_title('Negative')
axs[0, 1].axis('off')

axs[1, 0].imshow(log_transformed, cmap='gray')
axs[1, 0].set_title('Log Transformation')
axs[1, 0].axis('off')

axs[1, 1].imshow(inv_log_transformed, cmap='gray')
axs[1, 1].set_title('Inverse Log Transformation')
axs[1, 1].axis('off')

plt.show()

# Gamma correction
gamma = 0.5
gamma_transformed = np.power(img_double, gamma)

fig, axs = plt.subplots(1, 2, figsize=(10, 5))
axs[0].imshow(img_gray, cmap='gray')
axs[0].set_title('Original Image')
axs[0].axis('off')

axs[1].imshow(gamma_transformed, cmap='gray')
axs[1].set_title(f'Gamma Corrected (γ = {gamma})')
axs[1].axis('off')

plt.show()

# Compute histogram
hist, bins = np.histogram(img_gray.flatten(), 256, [0,256])

fig, axs = plt.subplots(1, 2, figsize=(10, 5))
axs[0].imshow(img_gray, cmap='gray')
axs[0].set_title('Grayscale Image')
axs[0].axis('off')

axs[1].hist(img_gray.ravel(), 256, [0, 256])
axs[1].set_title('Histogram')

plt.show()

# Contrast stretching
stretched_img = cv2.normalize(img_gray, None, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX)

fig, axs = plt.subplots(1, 2, figsize=(10, 5))
axs[0].imshow(img_gray, cmap='gray')
axs[0].set_title('Original Image')
axs[0].axis('off')

axs[1].imshow(stretched_img, cmap='gray')
axs[1].set_title('Contrast Stretched Image')
axs[1].axis('off')

plt.show()

# Histogram equalization
equalized_img = cv2.equalizeHist(img_gray)

fig, axs = plt.subplots(1, 2, figsize=(10, 5))
axs[0].imshow(img_gray, cmap='gray')
axs[0].set_title('Original Image')
axs[0].axis('off')

axs[1].imshow(equalized_img, cmap='gray')
axs[1].set_title('Histogram Equalized Image')
axs[1].axis('off')

plt.show()
