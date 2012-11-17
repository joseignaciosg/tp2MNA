function toWav(sheetname)

%reading triplets from sheet file
fid = fopen(sheetname,'r');
i=1;
while (! feof(fid) )
	triplets{i++} = fgetl(fid);
endwhile

%recovering notes frequencies
for i=1: length(triplets)
	frecs(i) = getNote(triplets{i});
endfor

%antitransformating frequencies
notes = ifft(frecs);

%creating the war
wavwrite(notes, 1/30e-3, 'test.wav');

plot(notes);



%file fragment size
fragsize = 30e-3;




endfunction

