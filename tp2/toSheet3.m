function toSheet3(wavname,Tm)


%reading the audio file
[y,fs,bps] = wavread(wavname);

nsamples = length(y);
disp('number of samples:'),disp(nsamples);

%sampling period
Ts = 1/fs;

%file fragment size
fragsize = Tm;

%triplets quantity
fileduration = Ts * nsamples;
N = floor( fileduration / fragsize );

%determing step (quantity of samples per interval)
step = floor( nsamples / N );

%obtaing notes frequencies
for i=1:N
	l = step*(i-1)+1;
	u = step*i;
	X = fftshift(fft(y(l:u)));
	%only positive part of the transformate
	X = X(floor(length(X)/2)+1:length(X));
	%plot((1:length(X)),X);
	[number, pos] = max(X);
	f = 0:fs/step:fs/2-1;
	notes(i) = f(pos);
endfor


%obtaining the equal temperament scale
fundamental = 16.375;
oct = -1;
for i=0 : 300
	if mod(i,12) == 0
		oct +=1;
	endif
	scale(i+1) = fundamental * 2^(oct + mod(i,12)/12);
endfor

%plot(notes);

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

if true%is_valid_file_id(sheetfile)
	for i=1: length(triplets)
		fdisp(sheetname,triplets{i});
	endfor
	fclose(sheetfile);
	disp("audio file converted successfully");
else
	disp("error creating sheet file");
endif


endfunction
