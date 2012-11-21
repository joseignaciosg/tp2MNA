function readPartiturev2(sps, bps, triplets)

	min_octave = 55;
	triplet_duration = 0.03;

	duration = triplet_duration * length(triplets(:,1));
	t = 0:1/sps:triplet_duration;

	wave = 0;
	phi = 0;
	for i=1:length(triplets(:,1))
		frequency = noteToFrequency(triplets(i,:));
		wave = [wave sin(2*pi*frequency*t + phi)];
		phi = phi + 2*pi*frequency*(t(length(t))+1/sps);
	endfor

	wavwrite(wave', sps, bps, 'audio.wav');

endfunction
