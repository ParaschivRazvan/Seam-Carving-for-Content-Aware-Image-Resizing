%Implementarea a proiectului Redimensionare imagini
%dupa articolul "Seam Carving for Content-Aware Image Resizing", autori S.
%Avidan si A. Shamir 
%%
%aceasta functie ruleaza intregul proiect 
%setati parametri si imaginile de redimensionat aici

%citeste o imagine
img = imread('../data/tajM.jpeg');

%reducem imaginea in latime cu 50 de pixeli
%seteaza parametri
parametri.optiuneRedimensionare = 'maresteInaltime';
parametri.numarPixeliLatime = 50;
parametri.ploteazaDrum = 0;
parametri.culoareDrum = [255 0 0]';%culoarea rosie
parametri.metodaSelectareDrum = 'programareDinamica';%optiuni posibile: 'aleator','greedy','programareDinamica'

imgRedimensionata_proiect = redimensioneazaImagine(img,parametri); 

%foloseste functia imresize pentru redimensionare traditionala
imgRedimensionata_traditional = imresize(img,[ size(imgRedimensionata_proiect,1) size(imgRedimensionata_proiect,2)]);

%ploteaza imaginile obtinute
figure, hold on;



%1. imaginea initiala
h1 = subplot(1,3,1);imshow(img);
xsize = get(h1,'XLim');ysize = get(h1,'YLim');
set(h1, 'XLim', xsize, 'YLim', ysize);
xlabel('imaginea initiala');

%2. imaginea redimensionata cu pastrarea continutului
h2 = subplot(1,3,2);
imshow(imgRedimensionata_proiect);
ysize = get(h2,'YLim');
if strcmp(parametri.optiuneRedimensionare,'maresteLatime') == 1
    xsize = get(h2,'XLim'); 
    set(h1, 'XLim', xsize, 'YLim', ysize);
else
    set(h2, 'XLim', xsize, 'YLim', ysize);  
end
xlabel('rezultatul nostru');

%3. imaginea obtinuta prin redimensionare traditionala
if strcmp(parametri.optiuneRedimensionare,'eliminaObiect') ~= 1
    h3 = subplot(1,3,3);imshow(imgRedimensionata_traditional);
    set(h3, 'XLim', xsize, 'YLim', ysize);
    xlabel('rezultatul imresize');
end
