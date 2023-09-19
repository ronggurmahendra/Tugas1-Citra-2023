

function ImageBrightening(image, a, b)
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            image(i,j) = max(min(a*image(i,j) + b, 255),0);
        end
    end
    imshow(image)
end
