function img1 = maresteLatime(img,numarPixeliLatime,metodaSelectareDrum,ploteazaDrum,culoareDrum)
%mareste imaginea cu un numar de pixeli 'numarPixeliLatime' pe latime
%
%input: img - imaginea initiala
%       numarPixeliLatime - specifica numarul de drumuri de sus in jos adaugate
%       metodaSelectareDrum - specifica metoda aleasa pentru selectarea drumului. Valori posibile:
%                           'aleator' - alege un drum aleator
%                           'greedy' - alege un drum utilizand metoda Greedy
%                           'programareDinamica' - alege un drum folosind metoda Programarii Dinamice
%       ploteazaDrum - specifica daca se ploteaza drumul gasit la fiecare pas. Valori posibile:
%                    0 - nu se ploteaza
%                    1 - se ploteaza
%       culoareDrum  - specifica culoarea cu care se vor plota pixelii din drum. Valori posibile:
%                    [r g b]' - triplete RGB (e.g [255 0 0]' - rosu)          
%                           
% output: img - imaginea redimensionata obtinuta prin eliminarea drumurilor

img1 = img;
img2 = img;
matriceDrumuri = zeros(size(img, 1), numarPixeliLatime);
for i = 1:numarPixeliLatime
    
    disp(['Selectam drumul vertical numarul ' num2str(i) ...
        ' dintr-un total de ' num2str(numarPixeliLatime)]);
    
    %calculeaza energia 
    E = calculeazaEnergie(img2);
    
    %alege drumul vertical care conecteaza sus de jos
    drum = selecteazaDrumVertical(E, metodaSelectareDrum);
    
    %adauga drumul in matricea de drumuri
    matriceDrumuri(:, i) = drum(:,2);
    
    %afiseaza drum
    if ploteazaDrum
        ploteazaDrumVertical(img2,E,drum,culoareDrum);
        pause(1);
        close(gcf);
    end
    
    %elimina drumul din imagine
    img2 = eliminaDrumVertical(img2,drum);

end


for i = 1:numarPixeliLatime
    
    disp(['Adaugam drumul vertical numarul ' num2str(i) ...
        ' dintr-un total de ' num2str(numarPixeliLatime)]);
    %adauga drum
    drum = [ [1:size(img1,1)]' matriceDrumuri(:,i)] ;
    img1 = adaugaDrumVertical(img1,drum);
    for k = i:numarPixeliLatime
       for p = 1:size(matriceDrumuri,1)
           if matriceDrumuri(p,k)>drum(p,2)
               matriceDrumuri(p,k) = matriceDrumuri(p,k) +1;
           end
       end
    end

end


