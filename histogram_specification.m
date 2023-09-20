function histogram_specification()
    % Membaca citra input
    input_image = imread('girl.png');

    % Membaca citra referensi
    reference_image = imread('home.png');

    % Menghitung histogram dari citra input
    input_histogram = imhist(input_image);

    % Menghitung histogram dari citra referensi
    reference_histogram = imhist(reference_image);

    % Melakukan histogram specification
    output_image = histeq(input_image, reference_histogram);

    % Menghitung histogram dari citra hasil histogram specification
    output_histogram = imhist(output_image);

    % Menampilkan output
    figure;
    imshow(input_image);
    title('Citra input');

    figure;
    imhist(input_image);
    title('Histogram citra input');

    figure;
    imshow(reference_image);
    title('Citra referensi');

    figure;
    imhist(reference_image);
    title('Histogram citra referensi');

    figure;
    imshow(output_image);
    title('Citra hasil histogram specification');

    figure;
    imhist(output_image);
    title('Histogram citra hasil histogram specification');
end
