function note = noteFromDistance(distance)
	distance = round(distance);
	if ((distance - -9) == 0)
		note = "C-";
	elseif ((distance - -8) == 0)
		note = "C#";
	elseif ((distance - -7) == 0)
		note = "D-";
	elseif ((distance - -6) == 0)
		note = "Eb";
	elseif ((distance - -5) == 0)
		note = "E-";
	elseif ((distance - -4) == 0)
		note = "F-";
	elseif ((distance - -3) == 0)
		note = "F#";
	elseif ((distance - -2) == 0)
		note = "G-";
	elseif ((distance - -1) == 0)
		note = "Ab";
	elseif ((distance - 0) == 0)
		note = "A-";
	elseif ((distance - 1) == 0)
		note = "Bb";
	else
		note = "B-";
	endif
endfunction
