function main()
    testContrastStreching()
    testImageBrightening()
    testImageNegative()
    testImageLog()
    testImagePow()
end

function testContrastStreching()
    % contrast streching
    % Load image
    image_color = imread('sample.png');  
    image_grey = rgb2gray(image_color);
    
    imshow(image_color);
    figure;
    imshow(image_grey);
    figure;
    colour_contraststreching(image_color);
    figure;
    greyscale_contraststreching(image_grey);
end

function testImageBrightening()
    % Image Brightening
    % Load image
    image_color = imread('sample.png');  
    image_grey = rgb2gray(image_color);
    
    imshow(image_color);
    figure;
    imshow(image_grey);
    figure;
    colour_imagebrightening(image_color,2,10);
    figure;
    greyscale_imagebrightening(image_grey,2,10);
end

function testImageNegative()
    % Image Negative
    % Load image
    image_color = imread('sample.png');  
    image_grey = rgb2gray(image_color);
    
    imshow(image_color);
    figure;
    imshow(image_grey);
    figure;
    colour_imagenegative(image_color);
    figure;
    greyscale_imagenegative(image_grey);
end


function testImageLog()
    % Image Logarithm
    % Load image
    image_color = imread('sample.png');  
    image_grey = rgb2gray(image_color);
    
    imshow(image_color);
    figure;
    imshow(image_grey);
    figure;
    colour_imagelog(image_color,1.5,1.5);
    figure;
    greyscale_imagelog(image_grey,1.5,1.5);
end


function testImagePow()
    % Image power
    % Load image
    image_color = imread('sample.png');  
    image_grey = rgb2gray(image_color);
    
    imshow(image_color);
    figure;
    imshow(image_grey);
    figure;
    colour_imagePow(image_color,2,2);
    figure;
    greyscale_imagePow(image_grey,2,2);
end

% asumsi 8 bit
function greyscale_imagebrightening(image, a, b)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            image(i,j) = max(min(a*image(i,j) + b, 255),0);
        end
    end
    imshow(image);
end



function colour_imagebrightening(image, a, b)
    [rows, cols, channel] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            for k = 1:channel
                image(i,j,k) = max(min(a*image(i,j,k) + b, 255),0);
            end
        end
    end
    imshow(image);
end

function greyscale_imagenegative(image)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            % asumsi 8 bit
            image(i,j) = 255 - image(i,j);
        end
    end
    imshow(image);

end
    
function colour_imagenegative(image)
    [rows, cols, channel] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            for k = 1:channel
                % asumsi 8 bit
                image(i,j,k) = 255 - image(i,j,k);
            end
        end
    end
    imshow(image);
end

    
function greyscale_imagelog(image,c,r)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            % asumsi 8 bit
            image(i,j) = max(min(c * log( double(image(i,j)) + r ), 255),0); 
        end
    end
    imshow(image);

end
    
function colour_imagelog(image, c,r)
    [rows, cols, channel] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            for k = 1:channel
                % asumsi 8 bit
                image(i,j,k) = max(min(c * log( double(image(i,j,k)) + r ), 255),0); 
            end
        end
    end
    imshow(image);
end

function greyscale_imagePow(image,c,y)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            % asumsi 8 bit
            image(i,j) = max(min(c * ( image(i,j) ^ y ), 255),0); 
        end
    end
    imshow(image);

end
    
function colour_imagePow(image, c,y)
    [rows, cols, channel] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            for k = 1:channel
                % asumsi 8 bit
                image(i,j,k) = max(min(c * ( image(i,j,k) ^ y ), 255),0); 
            end
        end
    end
    imshow(image);
end

function outputImage = greyscale_contraststreching(image)
    outputMin = 0;
    outputMax = 255;

    minValue = min(image(:));
    maxValue = max(image(:));
    outputImage = (double(image) - min(double(image(:)))) / (max(double(image(:))) - min(double(image(:)))) * (outputMax - outputMin) + outputMin;
    outputImage = uint8(outputImage);

    imshow(outputImage);

end
    
function outputImage = colour_contraststreching(image)
    outputMin = 0;
    outputMax = 255;

    R = double(image(:, :, 1));
    G = double(image(:, :, 2));  
    B = double(image(:, :, 3));
    

    R_stretched = (double(R) - min(R(:))) / (max(R(:)) - min(R(:))) * (outputMax - outputMin) + outputMin;
    G_stretched = (double(G) - min(G(:))) / (max(G(:)) - min(G(:))) * (outputMax - outputMin) + outputMin;
    B_stretched = (double(B) - min(B(:))) / (max(B(:)) - min(B(:))) * (outputMax - outputMin) + outputMin;

    outputImage = cat(3, uint8(R_stretched), uint8(G_stretched), uint8(B_stretched));

    imshow(outputImage);
end

    

    

    

    
