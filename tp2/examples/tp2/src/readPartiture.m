function readPartiture(sps, bps, triplets)

	min_octave = 55;
	triplet_duration = 0.01;

	duration = triplet_duration * length(triplets(:,1));
	t = 0:1/sps:triplet_duration;

	wave = 0;
	for i=1:length(triplets(:,1))
		frequency = noteToFrequency(triplets(i,:));
		wave = [wave sin(2*pi*frequency*t)];
	endfor

	wavwrite(wave', sps, bps, 'audio.wav');

endfunction
