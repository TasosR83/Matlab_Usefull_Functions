function [ closest ] = find_n_closest_integers( number,n )
%finds n closest integers to given positive number

closest=zeros(n);
if mod(number,1)==0 %dwsmenos=akeraios
    if mod(n,2)==1  % PERITTO  plithos kontinwn
        closest=(number -floor(n/2)):(number+floor(n/2));
    else
        %n=ARTIOS
        error('Cant find EVEN number of points closest to an integer')
    end
else
    kentro = round(number);
    if kentro == floor(number) %STROGULOPOIITHIKE PROS TA KATW
        if mod(n,2)==1  % PERITTO  plithos kontinwn
            closest = (kentro -floor(n/2)):(kentro+floor(n/2));
        else
            closest = (kentro - (n/2)+1):(kentro + (n/2));
        end
        
    else %STROGULOPOIITHIKE PROS TA panw
        if mod(n,2)==1  % PERITTO  plithos kontinwn
            closest = (kentro -floor(n/2)):(kentro+floor(n/2));
        else
            closest = (kentro -(n/2)+1):(kentro+(n/2));
        end
    end
    
end

end

