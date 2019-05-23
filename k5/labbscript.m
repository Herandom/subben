%% labbscript
databis=load('207bi_46_5h.txt');
databack=load('background_97h.txt');
%fixar så vi får per timme
databackperhour2=databack(:,2)./97;
databackperhour=[databack(:,1) databackperhour2]

databisperhour2=databis(:,2)./46.5;
databisperhour=[databis(:,1) databisperhour2]

bismutpeaks=[482 976 1048]%keV
figure(1)
plot(databis(:,1),databis(:,2))
xlabel('kanaler')
ylabel('Counts')
figure(432)
plot(databisperhour(:,1),databisperhour(:,2))
xlabel('kanaler')
ylabel('Counts / hour')


figure(2321)
plot(databackperhour(:,1),databackperhour(:,2))
xlabel('kanaler')
ylabel('Counts / hour')
%% bakgrundkalibrerad bismut

databisperhour3=databisperhour2-databackperhour2;
databisbackkal=[databis(:,1) databisperhour3];
figure(23198)
plot(databisbackkal(:,1), databisbackkal(:,2))
xlabel('kanaler')
ylabel('Counts / hour')

%%
databis=databisbackkal;
rangemin1=2704;  %338.3
rangemax1=2795; %350.3
[peak1,fit1,fitrange1]=fitpeak(rangemin1,rangemax1,databis(:,1),databis(:,2));
disp('jao')
%%
%line([3000,5000],[2530/2 2530/2])
rangemin3=5530;%692.7;
rangemax3=5630%704.7;
[peak3,fit3,fitrange3]=fitpeak(rangemin3,rangemax3,databis(:,1),databis(:,2));
disp('d')

%%
rangemin4=5949;%743.7;
rangemax4=6051%759.7;
[peak4,fit4,fitrange4]=fitpeak(rangemin4,rangemax4,databis(:,1),databis(:,2));
disp('pirog')

%%
ett=polyfit([peak1 peak3 peak4],bismutpeaks,1);
ch=databis(:,1);
e=ett(1)*ch+ett(2);

figure(2);
semilogy(e,databis(:,2))
xlabel('keV')
ylabel('Counts')
figure(3)
plot(e,databis(:,2))

xlabel('keV')
ylabel('Counts')
