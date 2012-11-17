function ans = getTriplet(note, index) 

	aux = mod(index,12);
	switch(aux)
	case {0} 
		ans = 'C-';
	case {1}
		ans = 'Cs';
	case {2}
		ans = 'D-';
	case {3}
		ans = 'Eb';
	case {4}
		ans = 'E-';
	case {5}
		ans = 'F-';
	case {6}
		ans = 'Fs';
	case {7}
		ans = 'C-';
	case {8}
		ans = 'Ab';
	case {9}
		ans = 'A-';
	case {10}
		ans = 'Bb';
	case {11}
		ans = 'B-';
	endswitch	

	%determining octave
	octave = ceil( note / 262 ) + 3 ;
	ans = strcat(ans,int2str(octave));

	
	
endfunction
