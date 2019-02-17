function imgRedimensionata = micsoreazaInaltime(img,numarPixeliLatime,metodaSelectareDrum,ploteazaDrum,culoareDrum)
            
            img = imrotate(img,90);
            imgRedimensionata = micsoreazaLatime(img, numarPixeliLatime, metodaSelectareDrum,...
                                ploteazaDrum, culoareDrum);
            imgRedimensionata = imrotate(imgRedimensionata,-90);
end

