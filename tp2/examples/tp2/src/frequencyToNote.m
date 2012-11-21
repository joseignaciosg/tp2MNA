function n = frequencyToNote(f)

	if (f == 0)
		n = "S--";	% Silence
		return;
	endif

	f_A4 = 440;
	o_A4 = 4;
	delta = 5;
	o_interval = [ 32.07 - delta , 61.73 + delta ];
	up_distance_to_new_octave = 3;
	down_distance_to_new_octave = 10;

	octave = 1;
	while(f < o_interval(1) || o_interval(2) < f)
		o_interval = o_interval * 2;
		octave = octave + 1;
	endwhile

	sign = sign(octave - o_A4);
	v = f / f_A4;
	v = log2(v) * 12;

	distance = v;
	if (sign != 0)
		distance = distance - (octave - o_A4 - sign) * 12;
		distance = distance - sign * (down_distance_to_new_octave + up_distance_to_new_octave - 1);
	endif

	n = noteFromDistance(distance);
	n = horzcat(n, num2str(octave));
	
endfunction
