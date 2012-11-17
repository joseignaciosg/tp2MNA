function closest = isClosest(number , array)

n = length(array);
closest = array(1);
closestmatch = abs(number-closest);

for i = 2: n
	if abs(number-array(i)) < closestmatch
		closest = array(i);
		closestmatch = abs(number-closest);
	endif	
endfor


endfunction
