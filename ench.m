

function main()
    % Load image
    % image_gray = imread('contoh_grayscale.png'); 
    image_color = imread('sample.png');  

    image_grey = rgb2gray(image_color);
    imshow(image_color);
    figure;
    imshow(image_grey);
    figure;
    colour_contraststreching(image_color);

    % grayscale_hist(image_gray);

    figure;
    greyscale_contraststreching(image_grey);
    
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
    
function colour_imagenegative(image, a, b)
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
            image(i,j) = max(min(c * log( image(i,j) + r ), 255),0); 
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
                image(i,j,k) = max(min(c * log( image(i,j,k) + r ), 255),0); 
            end
        end
    end
    imshow(image);
end

function greyscale_imagepow(image,c,y)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            % asumsi 8 bit
            image(i,j) = max(min(c * ( image(i,j) ^ r ), 255),0); 
        end
    end
    imshow(image);

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
    imshow(image);
end

function greyscale_contraststreching(image)
    outputMin = 0;
    outputMax = 255;

    minValue = min(image(:));
    maxValue = max(image(:));
    % range = maxValue - minValue;
    % for i = 1:rows
    %     for j = 1:cols
    %         % asumsi 8 bit
    %         pixelNorm = uint8(image(i,j) - minValue ) / (maxValue - minValue);
    %         image(i,j) = pixelNorm * 255;
    %     end
    % end

    outputImage = (image - minValue) / (maxValue - minValue) * (outputMax );
    outputImage = uint8(outputImage);

    imshow(outputImage);

end
    
function colour_contraststreching(image)
    % image = double(image);
    % [rows, cols, channel] = size(image);
    % rmin = min(image(:));
    % rmax = max(image(:));
    % stretched_image = uint8((double(image) - rmin) / (rmax - rmin)) * 255;
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
    % for k = 1:channel
    %     minValue = min(image(:,k));
    %     maxValue = max(image(:,k));
    %     range = maxValue - minValue;
    %     for i = 1:rows
    %         for j = 1:cols
    %             % asumsi 8 bit
    %             pixelNorm = double( double(image(i,j,k) - minValue ) / range);
    %             image(i,j,k) = pixelNorm * 255 ;
    %         end 
    %     end
    % end
    % imshow(image);
end

    

    

    

    
