%% labbscript
bismutpeaks=[482 976 1048]%keV
figure(1)
plot(data(:,1),data(:,2))
xlabel('kanaler')
ylabel('Counts')
%%

rangemin1=338.3;
rangemax1=350.3;
[peak1,fit1,fitrange1]=fitpeak(rangemin1,rangemax1,data(:,1),data(:,2));
disp('jao')
%%
%line([3000,5000],[2530/2 2530/2])
rangemin3=692.7;
rangemax3=704.7;
[peak3,fit3,fitrange3]=fitpeak(rangemin3,rangemax3,data(:,1),data(:,2));
disp('d')

%%
rangemin4=743.7;
rangemax4=759.7;
[peak4,fit4,fitrange4]=fitpeak(rangemin4,rangemax4,data(:,1),data(:,2));
disp('pirog')

%%
ett=polyfit([peak1 peak3 peak4],bismutpeaks,1);
ch=data(:,1);
e=ett(1)*ch+ett(2);

figure(2);
semilogy(e,data(:,2))
xlabel('keV')
ylabel('Counts')
figure(3)
plot(e,data(:,2))

xlabel('keV')
ylabel('Counts')
