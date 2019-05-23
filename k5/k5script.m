%% K5
clear
%data.txt är från labbet
data=load('207bi_46_5h.txt');
plot(data(:,1), data(:,2))
E1 = 1.0323;
E3 = 2.8020;
E4 = 2.9589;
%%
rangemin1=1434;
rangemax1=1527;
[peak1,fit1,fitrange1]=fitpeak(rangemin1,rangemax1,data(:,1),data(:,2));
disp('jao')
%%
line([3000,5000],[2530/2 2530/2])
rangemin3=4016;
rangemax3=4077;
[peak3,fit3,fitrange3]=fitpeak(rangemin3,rangemax3,data(:,1),data(:,2));
disp('d')

%%
line([4100,5000],[2530/2 2530/2])
rangemin4=4242;
rangemax4=4303;
[peak4,fit4,fitrange4]=fitpeak(rangemin4,rangemax4,data(:,1),data(:,2));
disp('pirog')

%%
ett=polyfit([peak1 peak3 peak4],[E1,E3,E4],1);
ch=data(:,1);
e=ett(1)*ch+ett(2);

figure;semilogy(e,data(:,2))
xlabel('MeV')
ylabel('Counts')
figure
plot(e,data(:,2))

xlabel('MeV')
ylabel('Counts')
%%
e(int32(peak3))
 


%E2=1.19MeV
%Q2=2.262ish, slutet av bullen