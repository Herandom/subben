%% labbscript
datacesiuminput=load('137cs_117h.txt');
z=-56;
datacesiumperhour=[datacesiuminput(:,1) datacesiuminput(:,2)./117] %perhour
datacesium2=datacesiumperhour(:,2)-databackperhour2;
mellanmatris=datacesium2>0;
datacesium2=datacesium2.*mellanmatris;
datacesium=[datacesiuminput(:,1) datacesium2];%kalibrerad

%% okaldataback
figure(23131)
cesiumpeaks=[482 976 1048]%keV
plot(datacesiuminput(:,1),datacesiuminput(:,2))
xlabel('Kanaler')
ylabel('Counts')

figure(898)
semilogy(e,datacesiuminput(:,2))
xlabel('keV')
ylabel('Counts')

%% kalibrerad
figure(231312)
cesiumpeaks=[482 976 1048]%keV
plot(datacesium(:,1),datacesium(:,2))
xlabel('Kanaler')
ylabel('Counts/ hour')

figure(8982)
semilogy(e,datacesium(:,2))
xlabel('keV')
ylabel('Counts/ hour')

%%
[kuriedata]=kurieplot(e,datacesium,z); %56 antal protoner
%69.68 456.6
%index:48:326

%%
[slope1,offset1]=kuriefit(e,kuriedata,[57.02;453.9])%kuriefit(e,kuriedata,[69.68;456.6])
%%
[slope2,offset2]=kuriefit(e,kuriedata,[699.6;996.9])%[696.1;1000])

%%
q1=-offset1/slope1
q2=-offset2/slope2
%%
lambda=log(2)/30
lambda1=0.9*lambda
lambda2=0.1*lambda

tHalva1=log(2)/lambda1
tHalva2=log(2)/lambda2

tHalva1sec=365*24*3600*tHalva1
tHalva2sec=365*24*3600*tHalva2

logthalva1=log10(tHalva1sec)
logthalva2=log10(tHalva2sec)

%%
logf1=logf(z,q1)

logft1=logthalva1+logf1
logf2=logf(z,q2)
logft2=logthalva2+logf2