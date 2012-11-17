function ret = getNote(triplet)

	fundamental = 16.375;
	oct = triplet(3);
	note = strtrunc(triplet,2);
	switch(note)
        case {'C-'}
                aux = 0;
        case {'Cs'}
                aux = 1;
        case {'D-'}
                aux = 2;
        case {'Eb'}
                aux = 3;
        case {'E-'}
                aux = 4;
        case {'F-'}
                aux = 5;
        case {'Fs'}
                aux = 6;
      	case {'G-'}
		aux = 7;
	case {'Ab'}
		aux = 8;
	case {'A-'}
		aux = 9;
	case {'Bb'}
		aux = 10;
	case {'B-'}
		aux = 11;
	endswitch
	oct = str2num(oct);
	ret = fundamental * 2^(oct+(aux/12));

endfunction
