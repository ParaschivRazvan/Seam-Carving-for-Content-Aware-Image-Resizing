function img1 = adaugaDrumVertical(img,drum)
        %adauga drumul vertical 
        %input: img - imaginea initiala
        %       drum - drumul vertical
        %output img1 - imaginea initiala cu drumul adaugat
        img1 = zeros(size(img,1),size(img,2)+1,size(img,3),'uint8');
        
        for i=1:size(img1,1)
                coloana = drum(i,2);
                %copiem partea din stanga
                img1(i,1:coloana - 1,:) = img(i,1:coloana - 1,:);
                %copiem partea din dreapta
                img1(i,coloana+1:end,:) = img(i,coloana:end,:);
        
                %completati aici codul vostru
                if coloana == 1
                    img1(i,coloana ,:) = img1(i,coloana + 1,:);
                    img1(i,coloana + 1,:) = img1(i,coloana,:) / 2 + img1(i, coloana + 2,:) / 2;
                    
                elseif coloana == size(img, 2)
                    img1(i,coloana ,:) = img1(i,coloana - 1,:) / 2 + img1(i, coloana + 1,:) / 2;
                else  
                    img1(i,coloana,:) = img1(i,coloana - 1,:) / 2 + img1(i, coloana + 1,:) / 2;
                    img1(i,coloana + 1,:) = img1(i,coloana + 1,:) / 2 + img1(i,coloana + 2,:) /2;
                end
        end