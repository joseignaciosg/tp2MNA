function toSheet(wavname,Tm)


%reading the audio file
[y,fs] = wavread(wavname);

%obtaining the most suitable 2 factor
%factors = [2,2²,2³,2⁴,2⁵,2⁶,2⁷,2⁸,2⁹,2^10,2^11];
%nsamples = isClosest(fs,factors);
nsamples = length(y);
disp('number of samples:'),disp(nsamples);


%obtaining the sampling frequency
%f = nsamples/30e-3; 
%disp('sampling frequency'),disp(f);

%ploting samples
%x = y(1:nsamples);
%plot(x);:

%obtaining the transformed vector
X = fft(y);
X = abs(X);
X = fftshift(X);


%sampling period
Ts = 1/fs;

%file fragment size
fragsize = Tm;

%triplets quantity
fileduration = Ts * nsamples;
N = floor( fileduration / fragsize );

%determing step
step = floor(nsamples/N);

%obtaing notes frequencies
k=1;
for i=1 :step: nsamples-step
	notes(k) = max(X(i:i+step));
	k++;
endfor
notes(k) = max(X(i:nsamples));

%obtaining the equal temperament scale
scale = getScale();
%disp (scale);

%plot(notes);

%finding notes matches
for i=1: length(notes)
	truenotes(i) = isClosest(notes(i),scale);	
endfor
disp('notes quantity:');
disp(length(notes));

plot(truenotes);

%generating triplets
for i=1: length(truenotes)
	triplets{i} = getTriplet(truenotes(i));
endfor


%writing sheet
names = strsplit(wavname,"/");
name = names{length(names)};
sheetname = strcat("sheet-",name,".txt");
disp(sheetname);
[sheetfile,msg] = fopen(sheetname,'w');
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
