function toWav3(sheetname,Tm)

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

%plot(frecs)
triplet_duration = Tm;

sps = 11025;
duration = triplet_duration * length(triplets(:,1));
t = 0:1/sps:triplet_duration;
disp("t:"),
disp(t)

wave = 0;
for i=1:length(frecs)
	frequency = frecs(i);
	wave = [wave sin(2*pi*frequency*t)];
endfor

plot((1:length(wave)),wave)

wavwrite(wave', sps, 16,'audio.wav');


endfunction

