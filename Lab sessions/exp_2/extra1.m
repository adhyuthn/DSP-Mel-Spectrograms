a=imread('image.jpg');
g_a = rgb2gray(a);
g_a_d = upsample(g_a, 1);
figure;
imshow(g_a);
figure;
imshow(g_a_d);
