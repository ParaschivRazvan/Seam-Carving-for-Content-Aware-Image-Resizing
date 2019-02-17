function imgRedimensionata = amplificaContinut(img, metodaSelectareDrum, ploteazaDrum, culoareDrum, factor)
        
    img1 = img;
    img1 = imresize(img1,factor);      
    [H,L,~] = size(img);
    [H1,L1,~] = size(img1);
        
    numarPixeliLatime = L1-L;
    imgRedimensionata = micsoreazaLatime(img1, numarPixeliLatime, metodaSelectareDrum,...
                            ploteazaDrum, culoareDrum);
    
    imgRedimensionata = imrotate(imgRedimensionata, -90);
    numarPixeliLatime = H1-H;
    imgRedimensionata = micsoreazaLatime(imgRedimensionata, numarPixeliLatime, metodaSelectareDrum,...
                            ploteazaDrum, culoareDrum);
    imgRedimensionata = imrotate(imgRedimensionata, 90);

end

