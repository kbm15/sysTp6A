hh =dtmfdesign(fb, 80, fs);
xx=dtmfdial('3',fs);
plot(conv(hh(:,5),xx),'v')
x=zeros(1,7);
for i=1:7
    x(i)=max(conv(xx,hh(:,i)));
end
x
hold off
plot(conv(hh(:,1),xx),'v')
hold on
plot(conv(hh(:,2),xx),'p')
plot(conv(hh(:,3),xx),'y')
plot(conv(hh(:,4),xx),'o')
%plot(conv(hh(:,5),xx),'b')
plot(conv(hh(:,6),xx),'g')
plot(conv(hh(:,7),xx),'r')