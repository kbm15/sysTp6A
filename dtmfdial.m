function xx = dtmfdial(keyNames,fs,tTono,tSilencio)
    %DTMFDIAL Genera una señal de tonos correspondientes al marcado ...
    % telef´onico DTMF.
    %
    % keyNames = vector de caracteres que contiene los d?gitos marcados
    % fs = frecuencia de muestreo
    % xx = vector con la concatenacion de las se~nales correspondientes ...
    % a cada uno de los d?gitos del vector keyNames
    numDigitos = length(keyNames);
    if nargin == 2
        tTono=0.2;
        tSilencio=0.05;
    end
    
    dtmf.keys = ['1', '2', '3';
    '4','5','6';
    '7','8','9';
    '*','0','#'];

    dtmf.colTones = ones(4,1)*[1209,1336,1477];
    dtmf.rowTones = [697;770;852;941]*ones(1,3);    
    ntime = numDigitos*fs*(tSilencio+tTono);
    xx=[];
    for zz=1:numDigitos
        [ii,jj]=find(keyNames(zz)== dtmf.keys);
        freCol=dtmf.colTones(ii,jj);
        freRow=dtmf.rowTones(ii,jj);
        tTon=(0:tTono*fs-1);
        tSil=zeros(1,tSilencio*fs-1);
        xx = [xx, cos(2*pi*freCol*tTon/fs)+cos(2*pi*freRow*tTon/fs) ];
        xx = [xx,tSil];
    end
end
