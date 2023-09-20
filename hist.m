
function main()
    clc;
    close all;
    clear all;
    % testHist()
    testHisteq()
end

function testHist()
    % Load image

    image_color = imread('sample.png');  
    figure;
    imshow(image_color);    
    image_gray = rgb2gray(image_color);
    figure;
    imshow(image_gray);

    % grayscale hist
    grayscale_hist(image_gray);
    % colour hist
    colour_hist(image_color);
end

function testHisteq()
    % Load image

    image_color = imread('sample.png');  
    figure;
    imshow(image_color);    
    image_gray = rgb2gray(image_color);
    figure;
    imshow(image_gray);

    % grayscale hist
    figure;
    grayscale_histEq(image_gray);
    % grayscale hist
    
    figure;
    colour_histEq(image_color);
end    

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
    % hist = zeros(1,256);
    R = zeros(1, 256);
    G = zeros(1, 256);
    B = zeros(1, 256);  
    
    [rows cols, channel ] = size(image);    
    no_of_pixels = rows*cols;
    n = 0 : 255;
    
    % for i= 1:rows      
    %     for j=1:cols
    %         hist(Image(i,j)+1) = hist(Image(i,j)+1)+1;
    %     end 
    % end 
    for i = 1:rows
        for j = 1:cols
            R(image(i,j,1) + 1)  = R(image(i,j,1) + 1) + 1;
            G(image(i,j,2) + 1)  = G(image(i,j,2) + 1) + 1;
            B(image(i,j,3) + 1)  = B(image(i,j,3) + 1) + 1;
        end
    end

    % for i=1:256
    %     hist(i)=hist(i)/no_of_pixels;
    % end
    for i=1:256
        R(i)=R(i)/no_of_pixels;
    end    
    for i=1:256
        G(i)=G(i)/no_of_pixels;
    end    
    for i=1:256
        B(i)=B(i)/no_of_pixels;
    end
    
    % temp=hist(1);
    % for i=2:256
    %     temp=temp+hist(i);
    %     hist(i)=temp;
    % end

    tempR=R(1);
    for i=2:256
        tempR=tempR+R(i);
        R(i)=tempR;
    end

    tempG=G(1);
    for i=2:256
        tempG=tempG+G(i);
        G(i)=tempG;
    end

    tempB=B(1);
    for i=2:256
        tempB=tempB+B(i);
        B(i)=tempB;
    end

    % for i = 1:rows 
    %     for j = 1:cols
    %         outputImage(i,j) = hist(Image(i,j)+1);
    %     end
    % end
    for i = 1:rows 
        for j = 1:cols
            R_out(i,j) = R(image(i,j,1)+1);
        end
    end
    for i = 1:rows 
        for j = 1:cols
            G_out(i,j) = G(image(i,j,2)+1);
        end
    end
    for i = 1:rows 
        for j = 1:cols
            B_out(i,j) = B(image(i,j,3)+1);
        end
    end
    % outputImage = cat(3, uint8(R_out), uint8(G_out), uint8(B_out));
    for i = 1:rows 
        for j = 1:cols
            outputImage(i,j,1) = R_out(i,j);
            outputImage(i,j,2) = G_out(i,j);
            outputImage(i,j,3) = B_out(i,j);
        end
    end
    figure;
    imshow(outputImage);
end


function outputImage = grayscale_histEq(Image)
    hist = zeros(1,256);  
    
    [rows cols] = size(Image);    
    no_of_pixels = rows*cols;
    n = 0 : 255;
    
    for i= 1:rows      
        for j=1:cols
            hist(Image(i,j)+1) = hist(Image(i,j)+1)+1;
        end 
    end 
    
    for i=1:256
        hist(i)=hist(i)/no_of_pixels;
    end
    
    temp=hist(1);
    for i=2:256
        temp=temp+hist(i);
        hist(i)=temp;
    end

    for i = 1:rows 
        for j = 1:cols
            outputImage(i,j) = hist(Image(i,j)+1);
        end
    end
    figure;
    imshow(outputImage);
    % =================================

    % [rows, cols] = size(image);
    % hist = zeros(1, 256);
    % hist = grayscale_hist(image)

    % histEq = zeros(1, 256);
    
    % for i = 1:256
    %     sum = 0
    %     for j = 1:i
    %         sum = sum + hist(j);
    %     end
    %     histEq(i) = floor(255*sum);
        
    % end

    % for i = 1:rows
    %     for j = 1:cols
    %         outputImage(i,j) = max(min(histEq(max(min(image(i,j)+1,255), 0)), 255), 0);
    %     end
    % end

    % figure;
    % imshow(outputImage);
    % figure;
    % grayscale_hist(outputImage)


    % =================================
    % [rows, cols] = size(image);
    % hist = zeros(1, 256);
    % hist = grayscale_hist(image)

    % for i = 1:rows
    %     for j = 1:cols
    %         intensity = double(image(i, j)) + 1; % MATLAB indexing starts from 1
    %         hist(intensity) = hist(intensity) + 1;
    %     end
    % end

    
    % histEq = zeros(1, 256); % histogram hasil perataan
    % % Hitung histogram kumulatif
    % sum = 0;
    % for i = 1:256
    %     sum = sum + hist(i);
    %     histEq(i) = floor(255 * sum / (rows * cols));
    % end
    %  % Update citra sesuai histogram hasil perataan
    % for i = 1:rows
    %     for j = 1:cols
    %         outputImage(i, j) = histEq(double(image(i, j))); % MATLAB indexing starts from 1
    %     end
    % end
    % figure;
    % imshow(outputImage);
    % figure;
    % grayscale_hist(outputImage)
end