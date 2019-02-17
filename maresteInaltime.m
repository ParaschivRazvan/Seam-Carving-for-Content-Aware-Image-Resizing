function imgRedimensionata = maresteInaltime(img,numarPixeliLatime,metodaSelectareDrum,...
                                ploteazaDrum,culoareDrum)
            img = imrotate(img,90);
            imgRedimensionata = maresteLatime(img, numarPixeliLatime, metodaSelectareDrum, ...
                ploteazaDrum, culoareDrum);
            imgRedimensionata = imrotate(imgRedimensionata,-90);

end

