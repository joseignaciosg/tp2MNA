function scale = test()

fundamental = 32.750/2;
oct = 0;
for i=0 : 300
	if mod(i,12) == 0
		oct +=1;
	endif
	scale(i+1) = fundamental * 2^(oct + mod(i,12)/12);
endfor

