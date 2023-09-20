function main()
    % Load image
 
    image_color = imread('sample.png');  
    figure;
    imshow(image_color);    
    image_grey = rgb2gray(image_color);
    figure;
    imshow(image_grey);
    myHistogramInstance = MyHistogramClass
    % Greyscale hist
    figure;
    grayscale_hist(image_grey);
    % colour hist
    figure;
    colour_hist(image_color);
end

