%convolution filter function
function img_new = convolution_filter(gr,w,s)

if numel(s)==1
    s=[s s];
end

%create zeros metrix
[m n] = size(gr);
zpad = zeros(m+s(2)-1,n+s(2)-1);
sc = floor(s(1)/2);
sr = floor(s(2)/2);
for i=1:m
    for j=1:n
        zpad(i+sr,j+sc) = gr(i,j);
    end
end

%filter
[c r] = size(zpad);
ms = zeros(s(2),s(1));
img_new = zeros(size(zpad));
for i=1:r-s(1)
    for j= 1:c-s(2)
        for a= 1:s(2)
            for b = 1:s(1)
                ms(a,b) = zpad(j+a-1,i+b-1);
            end
        end
        conv = ms*w;
        img_new(j+sr,i+sc)=(sum(conv(:)));
    end
end