[x,fm,bpm] = wavread('beet5_np.wav');

%Pasabajos
fc = 500;
wc = 2*pi*fc;
alpha = wc/fm;
A = [1 (alpha-1)];
B = alpha;

%Respuestas en frecuencia
fn = 1e-3:1e-3:.5;
f  = fm*fn;
Hdpb = alpha./(1-(1-alpha)*exp(-i*2*pi*fn));
%Hdb= freqz(B,A,2*pi*fn);
Hc = wc./(wc+i*2*pi*f);
figure(1)
loglog(f,abs(Hdpb),f,abs(Hc));
axis tight
grid on

%filtrado
xpb = filter(B,A,x);
xpbs = (4*xpb+x)/5;

%control de ganancia trucho
a = max(abs(x));
b = max(abs(xpb));
xpb = a/b*xpb;

b = max(abs(xpbs));
xpbs = a/b*xpbs;

wavwrite(xpb,fm,bpm,'crazypb.wav');
wavwrite(xpbs,fm,bpm,'crazypbs.wav');


%Pasaaltos
fc = 5000;
wc = 2*pi*fc;
alpha = wc/fm;

A = [(1+alpha) -1];
B = [1 -1];

%Respuestas en frecuencia
fn = 1e-3:1e-3:.5;
f  = fm*fn;
Hdpa = (1-exp(-i*2*pi*fn))./(1+alpha-exp(-i*2*pi*fn));
%Hdb= freqz(B,A,2*pi*fn);
Hc = (i*2*pi*f)./(wc+i*2*pi*f);
figure(2)
loglog(f,abs(Hdpa),f,abs(Hc));
axis tight
grid on

%filtrado
xpa = filter(B,A,x);
xpas = (4*xpa+x)/5;

%control de ganancia trucho
a = max(abs(x));
b = max(abs(xpa));
xpa = a/b*xpa;

b = max(abs(xpas));
xpas = a/b*xpas;

wavwrite(xpa,fm,bpm,'crazypa.wav');
wavwrite(xpas,fm,bpm,'crazypas.wav');


%%La señal original
N = 2^18;
to = ceil(20*fm);

x = x(to+(1:N));
xpb = xpb(to+(1:N));
xpa = xpa(to+(1:N));
idx = 1:4096;
t = 1/fm*(idx-1);
figure(3)
plot(t,x(idx),t,xpb(idx))
axis tight

figure(4)
plot(t,x(idx),t,xpa(idx))
axis tight

X = fftshift(fft(x));
X = X/max(abs(X));

Xpb = fftshift(fft(xpb));
Xpb = Xpb/max(abs(Xpb));

Xpa = fftshift(fft(xpa));
Xpa = Xpa/max(abs(Xpa));
ff = ((1:N) - ceil(N/2))/N*fm;
idx = 1:64:N;
figure(5)
semilogy(ff(idx),abs(X(idx)),ff(idx),abs(Xpb(idx)),f,abs(Hdpb))
axis tight

figure(6)
semilogy(ff(idx),abs(X(idx)),ff(idx),abs(Xpa(idx)),f,abs(Hdpa))
axis tight




return

%%Mi tuneado
xmi = (xpa+xpb*4)/5;
%control de ganancia trucho
a = max(abs(x));
b = max(abs(xmi));
xmi = a/b*xmi;

wavwrite(xmi,fm,bpm,'crazymi.wav');

%%Filtro posta
[B,A] = butter(10,2*fc/fm);
xpb = filter(B,A,x);
xpbs = (2*xpb+x)/3;

%control de ganancia trucho
a = max(abs(x));
b = max(abs(xpb));
xpb = a/b*xpb;

b = max(abs(xpbs));
xpbs = a/b*xpbs;

wavwrite(xpb,fm,bpm,'crazypb.wav');
wavwrite(xpb,fm,bpm,'crazypbs.wav');


