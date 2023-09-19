

function main()
    % Load image
    % image_gray = imread('contoh_grayscale.png'); 
    image_color = imread('sample.png');  
    imshow(image_color);

    randomgreyscaleimage=uint8(255*rand(100,100));
    % figure;
    % grayscale_hist(image_gray);

    figure;
    % colour_contraststreching(image_color,0.2,3);
    greyscale_contraststreching(randomgreyscaleimage);

end


% asumsi 8 bit
function greyscale_imagebrightening(image, a, b)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            image(i,j) = max(min(a*image(i,j) + b, 255),0);
        end
    end
    imshow(image)
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
    imshow(image)
end

function greyscale_imagenegative(image)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            % asumsi 8 bit
            image(i,j) = 255 - image(i,j)
        end
    end
    imshow(image)

end
    
function colour_imagenegative(image, a, b)
    [rows, cols, channel] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            for k = 1:channel
                % asumsi 8 bit
                image(i,j,k) = 255 - image(i,j,k)
            end
        end
    end
    imshow(image)
end

    
function greyscale_imagelog(image,c,r)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            % asumsi 8 bit
            image(i,j) = max(min(c * log( image(i,j) + r ), 255),0); 
        end
    end
    imshow(image)

end
    
function colour_imagelog(image, c,r)
    [rows, cols, channel] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            for k = 1:channel
                % asumsi 8 bit
                image(i,j,k) = max(min(c * log( image(i,j,k) + r ), 255),0); 
            end
        end
    end
    imshow(image)
end

function greyscale_imagepow(image,c,y)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            % asumsi 8 bit
            image(i,j) = max(min(c * ( image(i,j) ^ r ), 255),0); 
        end
    end
    imshow(image)

end
    
function colour_imagepow(image, c,y)
    [rows, cols, channel] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            for k = 1:channel
                % asumsi 8 bit
                image(i,j,k) = max(min(c * ( image(i,j,k) ^ y ), 255),0); 
            end
        end
    end
    imshow(image)
end

function greyscale_contraststreching(image)
    [rows, cols] = size(image);
    [minValue,idxmin] = min(image(:))
    [maxValue,idxmin] = max(image(:))
    range = maxValue - minValue
    for i = 1:rows
        for j = 1:cols
            % asumsi 8 bit
            pixelNorm = (image(i,j) - minValue ) / range
            image(i,j) = pixelNorm * 255
        end
    end
    imshow(image)

end
    
function colour_contraststreching(image)
    [rows, cols, channel] = size(image);
    
    for k = 1:channel
        minValue = min(image(:,k))
        maxValue = max(image(:,k))
        range = maxValue - minValue
        for i = 1:rows
            for j = 1:cols
                % asumsi 8 bit
                pixelNorm = (image(i,j,k) - minValue ) / range
                image(i,j,k) = pixelNorm * 255 
            end
        end
    end
    imshow(image)
end

    

    

    

    
