function xx= prueba()
    xx =generate_sin(1477,16000,1,3200,16000);
end
function x = generate_sin(frec,leng,x1,x2,fs)
    x=zeros(1,leng);
    t1=0:(1/fs):((leng-x2)/fs);
    t=[zeros(1,x1-1) t1 zeros(1,leng-x2)];
    length(t)
    x=sin(frec*t);
end