function img = eliminaObiect(img, metodaSelectareDrum, culoareDrum, ploteazaDrum)

figure; imshow(img);
re = getrect;
y_min = re(2);
x_min = re(1);
height = re(4);
width = re(3);


if width > height

y_minC = y_min;
x_minC = x_min;
x_min = y_minC;
y_min = size(img,2) - x_minC - width;
x_max = x_min + height;
y_max = y_min + width;
img = imrotate(img, 90);
finalWidth = height;
else
finalWidth = width;  
y_max = y_min + height;
x_max = x_min + width;

end

for i = 1:finalWidth
    disp(['Eliminam drumul vertical numarul ' num2str(i) 'dintr-un total de ' num2str(finalWidth)]);

    E = calculeazaEnergie(img);
    E = double(E);

    E(int32(y_min):int32(y_max), int32(x_min):int32(x_max)) = -10000;

    drum = selecteazaDrumVertical(E, metodaSelectareDrum);
 
    if ploteazaDrum
        ploteazaDrumVertical(img, E, drum, culoareDrum);
        pause(1);
        close(gcf);
    end
    x_max = x_max - 1;
 
    
    img = eliminaDrumVertical(img, drum);
end

if width > height
    img =  imrotate(img, -90);
end

