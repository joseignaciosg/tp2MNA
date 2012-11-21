function f = noteToFrequency(triplet)

	if (triplet == "S--")
		f = 0;	% Silence
		return;
	endif	

	f_A4 = 440;
	o_A4 = 4;
	up_distance_to_new_octave = 3;
	down_distance_to_new_octave = 10;
	
	note = substr(triplet,1,2);
	octave = str2num(substr(triplet,3,1));
	distance = distanceFromNote(note);

	sign = sign(octave - o_A4);
	if (sign != 0)
		n = distance + sign * (down_distance_to_new_octave + up_distance_to_new_octave - 1);
		n = n + (octave - o_A4 - sign) * 12;		
	else
		n = distance;
	endif
	
	f = power(2,  n/12) * f_A4;
	
endfunction
