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
		ans = 'G-';
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
	fundamental = 16.375;
	octave = floor( note / fundamental )  ;
	ans = strcat(ans,int2str(octave));

	
	
endfunction
