function distance = distanceFromNote(note)
	if (strcmp(note,"C-"))
		distance = -9;
	elseif (strcmp(note,"C#"))
		distance = -8;
	elseif (strcmp(note,"D-"))
		distance = -7;
	elseif (strcmp(note,"Eb"))
		distance = -6;
	elseif (strcmp(note,"E-"))
		distance = -5;
	elseif (strcmp(note,"F-"))
		distance = -4;
	elseif (strcmp(note,"F#"))
		distance = -3;
	elseif (strcmp(note,"G-"))
		distance = -2;
	elseif (strcmp(note,"Ab"))
		distance = -1;
	elseif (strcmp(note,"A-"))
		distance = 0;
	elseif (strcmp(note,"Bb"))
		distance = 1;
	elseif (strcmp(note,"B-"))
		distance = 2;
	endif
endfunction
