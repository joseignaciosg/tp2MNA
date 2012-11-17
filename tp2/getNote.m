function ans = getNote(triplet)

	fundamental = 32.750;
	octave = triplet(3);
	note = strtrunc(triplet,2);
	switch(note)
        case {'C-'}
                ans = 0;
        case {'Cs'}
                ans = 1;
        case {'D-'}
                ans = 2;
        case {'Eb'}
                ans = 3;
        case {'E-'}
                ans = 4;
        case {'F-'}
                ans = 5;
        case {'Fs'}
                ans = 6;
      	case {'G-'}
		ans = 7;
	case {'Ab'}
		ans = 8;
	case {'A-'}
		ans = 9;
	case {'Bb'}
		ans = 10;
	case {'B-'}
		ans = 11;
	endswitch

	ans = fundamental * 2^(octave+ans/12);

	

endfunction