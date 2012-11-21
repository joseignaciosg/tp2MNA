function partiture = writePartiture(frequencies)
	for i=1:length(frequencies)
		partiture(i,:) = frequencyToNote(frequencies(i));
	endfor
endfunction
