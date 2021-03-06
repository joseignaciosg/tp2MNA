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


%recovering frequencies of the notes
for i=1: length(triplets)
	frecs(i) = getNote(triplets{i});
endfor

disp(max(frecs));
disp(min(frecs));

fs = 1/Tm;
nsamples = length(triplets);
f = ((1:nsamples) )/nsamples /(1/fs);

plot(ifftshift(frecs));

%plot(ifft(ifftshift(frecs)));

%antitransformating frequencies
notes = ifft(ifftshift(frecs));

%normalizing
%notes = notes/norm(notes,'inf');

%plot(f,notes)

n = 431790/nsamples ;

%fix to have the same quantity of nytes as before
k = 1;
for i=1 : nsamples
	for j=k : n*i	
		salida(k++) = real( notes(i) );
	endfor
endfor

N = 431790;

f= (1:N) / N / Tm;

plot(f,salida)


%creating the wavifft(frecs)
wavwrite(salida', 11025, 'test.wav');
%wavwrite(notes', 1/30e-3, 'test.wav');
%plot(notes);

endfunction

