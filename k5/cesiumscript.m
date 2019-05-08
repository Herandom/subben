%% labbscript
datacesium=getk5_n1024;
z=-56;
%%
figure(23131)
cesiumpeaks=[482 976 1048]%keV
semilogy(datacesium(:,1),datacesium(:,2))
xlabel('Kanaler')
ylabel('Counts')

figure(898)
semilogy(e,datacesium(:,2))
xlabel('keV')
ylabel('Counts')
%%
[kuriedata]=kurieplot(e,datacesium,z); %56 antal protoner
%69.68 456.6
%index:48:326

%%
[slope1,offset1]=kuriefit(e,kuriedata,[69.68;456.6])
%%
%%
[slope2,offset2]=kuriefit(e,kuriedata,[696.1;1000])

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