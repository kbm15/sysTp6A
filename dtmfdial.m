function xx = dtmfdial(keyNames,fs,tTono,tSilencio)
    %DTMFDIAL Genera una señal de tonos correspondientes al marcado ...
    % telef´onico DTMF.
    %
    % keyNames = vector de caracteres que contiene los d?gitos marcados
    % fs = frecuencia de muestreo
    % xx = vector con la concatenacion de las se~nales correspondientes ...
    % a cada uno de los d?gitos del vector keyNames
    numDigitos = length(keyNames);
    if nargin < 3
        tTono=0.2;
        tSilencio=0.05;
    end
    if nargin < 4
        tSilencio=0.05;
    end
    dtmf.keys = ['1', '2', '3';
    '4','5','6';
    '7','8','9';
    '*','0','#'];

    dtmf.colTones = ones(4,1)*[1209,1336,1477];
    dtmf.rowTones = [697;770;852;941]*ones(1,3);
    ntime = tSilencio*numDigitos*fs + tTono*(numDigitos)*fs;
    xx=zeros(1,ntime);
    for i=1:numDigitos
        muestraActual=(i-1)*fs*(tTono+tSilencio)+1;
        [ii,jj]=find(keyNames(i)== dtmf.keys);
        freCol=dtmf.colTones(ii,jj);
        freRow=dtmf.rowTones(ii,jj);
        xx=xx + generate_sin(freCol,ntime,muestraActual,muestraActual + fs*tTono-1,fs,tTono)+ generate_sin(freRow,ntime,muestraActual,muestraActual + fs*tTono -1,fs,tTono);
    end
end
function x = generate_sin(frec,leng,x1,x2,fs,time)
    t1=0:(1/fs):(time-(1/fs));
    %%pequeño apaño porque matlab no sabe redondear por si solo cuando hay
    %%un numero e004
    l1=round(x1-1);
    l2=round(leng-x2);
    z1=zeros(1,l1);
    z2=zeros(1,l2);
    t=[z1, t1,z2];
    x=sin(2*pi*frec*t);
end