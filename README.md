Image Comparison with Edge Detection:

This repository contains a Processing sketch that compares two images using edge detection and calculates their cosine similarity. The sketch uses Sobel filters to detect the edges in the images and then computes the cosine similarity based on the edge orientations.

Requirements: 
* Processing 3.x

Getting Started:
1. Clone this repository to your local machine.
2. Open the sketch in the Processing IDE.
3. Make sure to place the two images you want to compare in the sketch's "data" folder and update the filenames in the setup() function.
4. Run the sketch to compare the images and see the cosine similarity in the console.

Code Overview:
The code is organized into the following functions:
- setup(): Initializes the sketch and loads the images, then calculates their edge orientation histograms and cosine similarity.
- fun(PImage img): Performs edge detection on the input image using Sobel filters and returns a 2D array with edge orientation histograms.
- cosi(float[][] A, float[][] B): Computes the cosine similarity between two edge orientation histograms.
