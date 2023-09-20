% https://www.geeksforgeeks.org/histogram-equalization-without-using-histeq-function-in-matlab/
function main()
    % Histogram Equalizer
    % Load image
    image_color = imread('sample.png');  
    image_grey = rgb2gray(image_color);
    
    imshow(image_color);
    figure;
    imshow(image_grey);
    figure;
    % colour_histEq(image_color);
    figure;
    % greyscale_histEq(image_grey);
end


function outputImage = colour_histEq(image)

end


function outputImage = greyscale_histEq(image)

end