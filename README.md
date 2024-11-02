# Photograph-Restoration
# Matrix Completion with Accelerated Gradient and Stochastic Gradient Descent

Welcome! This guide provides an overview of the Matrix Completion project using **Accelerated Gradient** and **Stochastic Gradient Descent (SGD)** methods. This project focuses on reconstructing a partially observed image by filling in the missing pixel values through optimization techniques.


# Project Overview

The project recovers a grayscale image with missing data by applying matrix completion techniques. The script uses an Accelerated Gradient Method and Stochastic Gradient Descent (SGD) to approximate the original image based on known pixel values.

## Files and Requirements
This project includes:

-   **Main MATLAB Script**: Handles image loading, preprocessing, and matrix completion.
-   **Image File (`bunny.jpg`)**: Sample grayscale image for testing.

**Requirements**:

-   MATLAB
-   Image Processing Toolbox

# Script Steps

### 1. Image Loading and Preprocessing

-   **Original Image**: The image (`bunny.jpg`) is loaded, converted to grayscale, resized, and normalized for processing.
-   **Simulated Blurred Image**: A specified number of pixels are randomly selected as "known" pixels, simulating an incomplete image with missing data.

### 2. Displaying Images

-   **Original Image Display**: Shows the original resized and grayscale image.
-   **Blurred Image Display**: Displays the image with only the known pixels, representing the "blurred" or partially known image.

### 3. Image Recovery Using Accelerated Gradient Method

-   **Initialization**: The initial matrix is randomly initialized, with known pixel values retained.
-   **Gradient Descent Loop**: The gradient is computed iteratively, with an accelerated update to enhance convergence speed.
-   **Stopping Criteria**: The method stops when a specified tolerance level is met or the maximum iteration count is reached.
-   **Recovered Image Display**: Shows the reconstructed image using the Accelerated Gradient Method and plots the stopping criteria over iterations.

### 4. Image Recovery Using Stochastic Gradient Descent (SGD)

-   **Initialization**: SGD parameters include batch size and learning rate.
-   **SGD Loop**: A random subset of known pixels is chosen for each iteration to compute a partial gradient for updating the matrix.
-   **Stopping Criteria**: Similar to the Accelerated Gradient method, with SGD-specific tuning.
-   **Recovered Image Display**: Shows the reconstructed image using SGD, along with a convergence plot.

## Key Variables

-   **A_bar**: Grayscale, resized version of the original image.
-   **A**: Partially known matrix with selected known pixels.
-   **omega**: Indexes of the known pixels in the image.
-   **alpha**, **beta**: Learning rate and momentum for the Accelerated Gradient method.
-   **alpha_sgd**, **batch_size**: Learning rate and batch size for SGD.
-   **maxiter**, **maxiter_sgd**: Maximum number of iterations for each method.
-   **vector_oprire**, **vector_oprire_sgd**: Arrays tracking convergence progress for each method.


# Output

1.  **Original and Blurred Images**: The resized, grayscale original and the incomplete "blurred" image with only known pixels.
2.  **Recovered Image - Accelerated Gradient**: Reconstructed image using the Accelerated Gradient Method.
3.  **Recovered Image - SGD**: Reconstructed image using Stochastic Gradient Descent (SGD).
4.  **Convergence Plots**: Visualization of the stopping criteria for both methods, showing convergence over iterations.

----------

## Example Usage

1.  Place `bunny.jpg` in the same directory as the script.
2.  Run the script in MATLAB.
3.  The images and convergence plots will display, allowing you to compare the effectiveness of each recovery method.
