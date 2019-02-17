function E = calculeazaEnergie(img)
    %calculeaza energia la fiecare pixel pe baza gradientului
    %input: img - imaginea initiala
    %output: E - energia
    
    %urmati urmatorii pasi:
    %transformati imaginea in grayscale
    %folositi un filtru sobel pentru a calcula gradientul in directia x si y
    %calculati magnitudinea gradientului
    %E - energia = gradientul imaginii
    
%sobel operator used to calculate gradient image
Grd=[ -1 -2 -1;
       0  0  0;
       1  2  1];
% Grd1=[ 0 -1 0; -1 4 -1 ; 0 -1 0];
[rows, cols, dim]=size(img);
Emean = zeros(rows,cols);
Eh = zeros(rows,cols);
Ev = zeros(rows,cols);
for i=1:dim
    Eh(:,:,i)=conv2(double(img(:,:,i)),Grd,'same');
    Ev(:,:,i)=conv2(double(img(:,:,i)),Grd.','same');
    Emean(:,:,i)=abs(Eh(:,:,i))+abs(Ev(:,:,i));
%     E(:,:,i)=conv2(X(:,:,i),Grd1,'same');
end
E=1/dim*sum(Emean,3);   %finds average gradient image if RGB image
    
