function play(wavFile)
	bps = 16;
	sps = 11025;
	readPartiturev2(sps, bps, writePartiture(getFrequencies(wavFile)));
endfunction
