feature = 1:10;
indice = [1 2 3];
for i=1:length(feature) 
  for j=1:length(indice);
    if feature(i) == indice(j)
      x(i) = 1;
    endif
  endfor
endfor
