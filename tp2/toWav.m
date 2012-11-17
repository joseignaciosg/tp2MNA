function toWav(sheetname,Tm)

%reading triplets from sheet file
fid = fopen(sheetname,'r');

if fid==-1
	disp("error opening file");
	exit(1);
endif

i=1;
while (! feof(fid) )
	triplets{i++} = fgetl(fid);
endwhile


%recovering notes frequencies
for i=1: length(triplets)
	frecs(i) = getNote(triplets{i});
endfor

disp(max(frecs));
disp(min(frecs));

fs = 1/Tm;
nsamples = length(triplets);
f = ((1:nsamples) -ceil (nsamples/2) )/nsamples /(1/fs);

plot(f,frecs);

%plot(ifft(ifftshift(frecs)));

%antitransformating frequencies
notes = ifft(frecs);

%creating the wavifft(frecs)
wavwrite(notes, Tm, 'test.wav');

%plot(notes);









endfunction

