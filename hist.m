
function main()
    testHist()
    % testHisteq()
end

function testHist()
    % Load image

    image_color = imread('sample.png');  
    figure;
    imshow(image_color);    
    image_grey = rgb2gray(image_color);
    figure;
    imshow(image_grey);

    % Greyscale hist
    figure;
    grayscale_hist(image_grey);
    % Greyscale hist
    
    figure;
    colour_hist(image_color);
end

function testHisteq()
    % Load image

    image_color = imread('sample.png');  
    figure;
    imshow(image_color);    
    image_grey = rgb2gray(image_color);
    figure;
    imshow(image_grey);

    % Greyscale hist
    figure;
    grayscale_histeq(image_grey);
    % Greyscale hist
    
    figure;
    colour_histeq(image_color);
    

function histogram = grayscale_hist(image)
    [rows, cols] = size(image);
    histogram = zeros(1, 256);

    for i = 1:rows
        for j = 1:cols
            pixel_value = image(i, j);
            histogram(pixel_value + 1) = histogram(pixel_value + 1) + 1;
        end
    end

    bar(histogram);
    title('Histogram Grayscale');
    xlabel('Intensity (0-255)');
    ylabel('Frequency');
end

function [R, G, B] = colour_hist(image)
    [rows, cols, ~] = size(image);
    R = zeros(1, 256);
    G = zeros(1, 256);
    B = zeros(1, 256);
    
    for i = 1:rows
        for j = 1:cols
            pixel_value = image(i, j, :);
            R(pixel_value(1) + 1)  = R(pixel_value(1) + 1) + 1;
            G(pixel_value(2) + 1)  = G(pixel_value(2) + 1) + 1;
            B(pixel_value(3) + 1)  = B(pixel_value(3) + 1) + 1;
        end
    end

    figure;
    subplot(3, 1, 1);
    bar(R, 'r');
    title('Histogram Red');
    xlabel('Intensity (0-255)');
    ylabel('Frequency');

    subplot(3, 1, 2);
    bar(G, 'g');
    title('Histogram Green');
    xlabel('Intensity (0-255)');
    ylabel('Frequency');

    subplot(3, 1, 3);
    bar(B, 'b');
    title('Histogram Blue');
    xlabel('Intensity (0-255)');
    ylabel('Frequency');
end

function outputImage = colour_histEq(image)

end


function outputImage = greyscale_histEq(image)

end