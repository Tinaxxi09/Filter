%average filter fuction
function [img_filtered] = average_filter(noisy_img)
    [m,n] = size(noisy_img);
    img_filtered = zeros(m,n);
    for i = 1:m-2
        for j = 1:n-2
            sum = 0;
            for k = i:i+2
                for l = j:j+2
                    sum = sum+noisy_img(k,l);
                end
            end
            img_filtered(i+1,j+1) = mean2(noisy_img(i:i+2,j:j+2));
        end
    end
end