function scale = getScale()

fundamental = 16.375;
oct = -1;
for i=0 : 300
        if mod(i,12) == 0
                oct +=1;
        endif
        scale(i+1) = fundamental * 2^(oct + mod(i,12)/12);
endfor

scale = scale';

endfunction
