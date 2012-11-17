function toSheet2(wavname,Tm)


%reading the audio file
[y,fs] = wavread(wavname);

nsamples = length(y);
disp('number of samples:'),disp(nsamples);

%sampling period
Ts = 1/fs;

%file fragment size
fragsize = Tm;

%triplets quantity
fileduration = Ts * nsamples;
N = floor( fileduration / fragsize );

%determing step
step = floor( nsamples / N );

%obtaing notes frequencies
k=1;
for i=1 :step: nsamples-step
	audio = y(i:i+step);
	X = fftshift(abs(fft(audio)));
	notes(k++) = max(X);
endfor
audio = y(i:nsamples);
X = fftshift(abs(fft(audio)));
notes(k) = max(X);


%obtaining the equal temperament scale
fundamental = 32.750/2;
oct = 0;
for i=0 : 300
	if mod(i,12) == 0
		oct +=1;
	endif
	scale(i+1) = fundamental * 2^(oct + mod(i,12)/12);
endfor
%disp (scale);

plot(notes);

%finding notes matches
for i=1: length(notes)
	truenotes(i) = isClosest(notes(i),scale);	
endfor
disp('notes quantity:');
disp(length(notes));

%plot(truenotes);

%generating triplets
for i=1: length(truenotes)
	triplets{i} = getTriplet(truenotes(i),i);
	%disp(getTriplet(truenotes(i),i));

endfor


%writing sheet
names = strsplit(wavname,"/");
name = names{length(names)};
sheetname = strcat("sheet-",name,".txt");
disp(sheetname);
[sheetfile,msg] = fopen(sheetname,'w+');
disp(msg);

if is_valid_file_id(sheetfile)
	for i=1: length(triplets)
		fdisp(sheetname,triplets{i});
	endfor
	fclose(sheetfile);
	disp("audio file converted successfully");
else
	disp("error creating sheet file");
endif


endfunction
