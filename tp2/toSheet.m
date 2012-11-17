function toSheet(wavname)


%reading the audio file
[y,fm] = wavread(wavname);

%obtaining the most suitable 2 factor
%factors = [2,2²,2³,2⁴,2⁵,2⁶,2⁷,2⁸,2⁹,2^10,2^11];
%nsamples = isClosest(fm,factors);
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
Tm = 1/fm;

%file fragment size
fragsize = 30e-3;

%triplets quantity
N = ceil( ( Tm * length(y) ) / fragsize);

%determing step
step = ceil(nsamples/N);

%obtaing notes frequencies
k=1
for i=1 :step: nsamples-step
	notes(k) = max(X(i:i+step));
	k++;
endfor

%obtaining the equal temperament scale
fundamental = 65.5;
for i=0: 100
	if mod(i,12) == 0
		fundamental *= 2;
	endif
	scale(i+1) = fundamental * 2^(mod(i,12)/12);
endfor
%disp (scale);

%finding notes matches
for i=1: length(notes)
	truenotes(i) = isClosest(notes(i),scale);	
endfor
disp('notes quantity:');
disp(length(notes));


%generating triplets
for i=1: length(truenotes)
	triplets{i} = getTriplet(truenotes(i),i);
	%disp(getTriplet(truenotes(i),i));

endfor


%writing sheet
name = strsplit(wavname,"/"){1}
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
