close all
clear all
%A = csvread('200mV_1MKCl_2uM_20190916_165922_EXPORT.csv',9000000,0,[9000000,0,10000000,1]);
TwoMHz1 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174157_EXPORT2.csv',1,0);
TwoMHz2 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174200_EXPORT.csv',1,0);
TwoMHz3 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174202_EXPORT.csv',1,0);
TwoMHz4 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174205_EXPORT.csv',1,0);
TwoMHz5 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174207_EXPORT.csv',1,0);
TwoMHz6 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174222_EXPORT.csv',1,0);
TwoMHz7 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174224_EXPORT.csv',1,0);
TwoMHz8 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174227_EXPORT.csv',1,0);
TwoMHz9 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174229_EXPORT.csv',1,0);
TwoMHz10 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174232_EXPORT.csv',1,0);
TwoMHz11 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174234_EXPORT.csv',1,0);
TwoMHz12 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174237_EXPORT.csv',1,0);
TwoMHz13 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174239_EXPORT.csv',1,0);
TwoMHz14 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174242_EXPORT.csv',1,0);
TwoMHz15 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174244_EXPORT.csv',1,0);
TwoMHz16 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174247_EXPORT.csv',1,0);
TwoMHz17 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174249_EXPORT1.csv',1,0);
TwoMHz18 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174249_EXPORT2.csv',1,0);
TwoMHz19 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174252_EXPORT.csv',1,0);
TwoMHz20 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174254_EXPORT.csv',1,0);
TwoMHz21 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174257_EXPORT.csv',1,0);
TwoMHz22 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174302_EXPORT.csv',1,0);
TwoMHz23 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174304_EXPORT.csv',1,0);
TwoMHz24 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174307_EXPORT.csv',1,0);
TwoMHz25 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174309_EXPORT1.csv',1,0);
TwoMHz26 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174309_EXPORT2.csv',1,0);
TwoMHz27 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174309_EXPORT3.csv',1,0);
TwoMHz28 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174312_EXPORT.csv',1,0);
TwoMHz29 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174314_EXPORT.csv',1,0);
TwoMHz30 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174317_EXPORT.csv',1,0);
TwoMHz31 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174319_EXPORT.csv',1,0);
TwoMHz32 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174322_EXPORT.csv',1,0);
TwoMHz33 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174324_EXPORT.csv',1,0);
TwoMHz34 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174327_EXPORT.csv',1,0);
TwoMHz35 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174329_EXPORT.csv',1,0);
TwoMHz36 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174332_EXPORT1.csv',1,0);
TwoMHz37 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174332_EXPORT2.csv',1,0);
TwoMHz38 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174334_EXPORT.csv',1,0);
TwoMHz39 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174337_EXPORT.csv',1,0);
TwoMHz40 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174339_EXPORT.csv',1,0);
TwoMHz41 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174342_EXPORT.csv',1,0);
TwoMHz42 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174344_EXPORT.csv',1,0);
TwoMHz43 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174347_EXPORT.csv',1,0);
TwoMHz44 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174349_EXPORT.csv',1,0);
TwoMHz45 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174352_EXPORT.csv',1,0);
TwoMHz46 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174354_EXPORT.csv',1,0);
TwoMHz47 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174357_EXPORT.csv',1,0);
TwoMHz48 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174412_EXPORT.csv',1,0);
TwoMHz49 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174414_EXPORT.csv',1,0);
TwoMHz50 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174417_EXPORT.csv',1,0);
TwoMHz51 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174419_EXPORT.csv',1,0);
TwoMHz52 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174422_EXPORT.csv',1,0);
TwoMHz53 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174424_EXPORT1.csv',1,0);
TwoMHz54 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174424_EXPORT2.csv',1,0);
TwoMHz55 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174427_EXPORT.csv',1,0);
TwoMHz56 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174429_EXPORT1.csv',1,0);
TwoMHz57 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174429_EXPORT2.csv',1,0);
TwoMHz58 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174432_EXPORT.csv',1,0);
% TwoMHz59 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174434_EXPORT.csv',1,0);
% TwoMHz60 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174437_EXPORT.csv',1,0);
% TwoMHz61 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174439_EXPORT.csv',1,0);

%% Merge Files 
TwoMHz = [TwoMHz1;TwoMHz2;TwoMHz3;TwoMHz4;TwoMHz5;TwoMHz6;TwoMHz7;TwoMHz8;TwoMHz9;TwoMHz10;
    TwoMHz11;TwoMHz12;TwoMHz13;TwoMHz14;TwoMHz15;TwoMHz16;TwoMHz17;TwoMHz18;TwoMHz19;TwoMHz20;
    TwoMHz21;TwoMHz22;TwoMHz23;TwoMHz24;TwoMHz25;TwoMHz26;TwoMHz27;TwoMHz28;TwoMHz29;TwoMHz30;
    TwoMHz31;TwoMHz32;TwoMHz33;TwoMHz34;TwoMHz35;TwoMHz36;TwoMHz37;TwoMHz38;TwoMHz39;TwoMHz40;
    TwoMHz41;TwoMHz42;TwoMHz43;TwoMHz44;TwoMHz45;TwoMHz46;TwoMHz47;TwoMHz48;TwoMHz49;TwoMHz50;
    TwoMHz51;TwoMHz52;TwoMHz53;TwoMHz54;TwoMHz55;TwoMHz56;TwoMHz57;TwoMHz58];
TwoMHz(:,2) = -TwoMHz(:,2);

figure(11)
bin_edges_11 = 0:0.001:20;
histogram(TwoMHz(:,2)*10^9,bin_edges_11);
fig11_c = histc(TwoMHz(:,2)*10^9,bin_edges_11);
hold on
set(gca,'yscale','log');
xlabel('Current (nA)');
ylabel('Counts');
title('All points');
%dlmwrite('All points_-200mV_pore2_5kbps.csv', TwoMHz(:,2).*10^9','-append','coffset',0);

%%
% plot(TwoMHz(:,2))
% plot(TwoMHz(:,4))
%%
Irms_2MHz = std(TwoMHz(:,2));
I0_2MHz = mean(TwoMHz(:,2));
%%
Sigma = 3;
Threshold_2MHz = I0_2MHz-Sigma*Irms_2MHz;

n=[];
o=[];
for i = 2:length(TwoMHz)
    if TwoMHz(i,2) < Threshold_2MHz && TwoMHz(i-1,2) > Threshold_2MHz
       TwoMHz(i,3) = 1;
       n=[n;i];
    elseif TwoMHz(i,2) > Threshold_2MHz && TwoMHz(i-1,2) < Threshold_2MHz
       TwoMHz(i-1,3) = 2;
       o=[o;i];
    end
end
%%
k=1;
for j = 1:length(n)
    if o(j)-2 > n(j)+1 && mean([TwoMHz(n(j)-30:n(j)-10,2);TwoMHz(o(j)+10:o(j)+30,2)])-mean(TwoMHz(n(j)+1:o(j)-2,2)) > Sigma*Irms_2MHz
    mydata{1,k} = TwoMHz(n(j)+1:o(j)-2,2);
    mydata{2,k} = [TwoMHz(n(j)-30:n(j)-10,2);TwoMHz(o(j)+10:o(j)+30,2)];
    k=k+1;
    end
end
%% 
% plot event
% 
% for  k = 5:10
%    data_temp = mydata{1,k};
%    data_temp5k = mydata{3,k};
%    for i = 1:length(data_temp)
%        data_temp(i,2) = i;
%    end
%    for j = 1:length(data_temp5k)
%        data_temp5k(j,2) = j;
%    end
%     
%    figure(k);
%    hold on
%    plot(data_temp(:,2),data_temp(:,1)*1e9);   
%    plot(data_temp5k(:,2),data_temp5k(:,1)*1e9); 
% end


%%
n=1;
for  k = 1:length(mydata)
     l = length(mydata{1,k});
     data_temp = mydata{1,k};
     data_temp_I = data_temp(:,1);
     T = 1*1e-6;
     data_temp_baseline = mydata{2,k};
     if length(data_temp_I) > 2 && length(data_temp_I) < 400 %&& std(data_temp_I)^2-std(data_temp_baseline)^2 > 0 
     storage(n,1)= mean(data_temp_I);
     storage(n,2)= min(data_temp_I);
     storage(n,3)= std(data_temp_I);
     storage(n,4)= length(data_temp_I)*T*10^6; % dwell_time
     storage(n,5)= mean(data_temp_baseline);
     storage(n,6)= std(data_temp_baseline);
     storage(n,7)= mean(data_temp_baseline)-mean(data_temp_I); %delta_I_by_mean
     storage(n,8)= (mean(data_temp_baseline)-mean(data_temp_I))/mean(data_temp_baseline);
     %percentage of blockage by mean
     storage(n,9)= (mean(data_temp_baseline)-min(data_temp_I))/mean(data_temp_baseline);
     %percentage of blockage (by min)
     if std(data_temp_I)^2-std(data_temp_baseline)^2 > 0
     storage(n,10)= sqrt(std(data_temp_I)^2-std(data_temp_baseline)^2);
     storage(n,11)= (mean(data_temp_baseline)-min(data_temp_I))/sqrt(std(data_temp_I)^2-std(data_temp_baseline)^2);
     %SNR_intra_event(by min)
     else
         storage(n,10)=0;
         storage(n,11)=0;
     end
     storage(n,12)= (mean(data_temp_baseline)-min(data_temp_I));
     
     storage(n,13)= (mean(data_temp_baseline)-min(data_temp_I))/std(data_temp_baseline);
     %SNR_baseline (by min)
     if std(data_temp_I)^2-std(data_temp_baseline)^2 > 0
     storage(n,14)=(mean(data_temp_baseline)-mean(data_temp_I))/sqrt(std(data_temp_I)^2-std(data_temp_baseline)^2);
     %SNR_intra_event(by mean)
     
     else
         storage(n,14)=0;
     end
     storage(n,15)=(mean(data_temp_baseline)-mean(data_temp_I))/std(data_temp_baseline);
     %SNR_baseline(by mean)
     n=n+1;
     
     end
end




%%

 I_measured = mean(storage(:,5))
 Delta_I_measured = mean(storage(:,7))
 Blockage_percentage_measured = mean(storage(:,8))
 
 bin_edges = 1.0e-08*0.1:1.0e-08*0.05:1.0e-08;
 %1 Histogram of Percetage blockage_mean
 figure(1)
 bin_edges_1 = 0:0.5:50;
 histogram(storage(:,8)*100,bin_edges_1);
 hold on

 xlabel('blockage percentage %');
 ylabel('Counts');
 title('Percentage blockage (mean)')
 
 %2 Histogram of Delta I
 figure(2)
 bin_edges_2 = 0:0.05:5;
 histogram(storage(:,7)*10^9,bin_edges_2);
 fig2_c = histc(storage(:,7)*10^9,bin_edges_2);
 hold on

 xlabel('\Delta I (nA)');
 ylabel('Counts');
 title('\Delta I (mean)')

 
 figure(3)
 bin_edges_3 = 0:0.05:5;
 histogram(storage(:,3)*10^9,bin_edges_3);
 fig3_c = histc(storage(:,3)*10^9,bin_edges_3);
 hold on

 xlabel('I_rms_event (nA)');
 ylabel('Counts');
 title('I_rms_event (mean)')
 
 
%  %3 Histogram of Delta I by min and mean
 figure(7)
 bin_edges_3 = 0.5:0.1:2.5;
 histogram(storage(:,7)*10^9,bin_edges_3,'FaceColor','b');
 hold on
 histogram(storage(:,12)*10^9,bin_edges_3,'FaceColor','r');
 legend('\Delta I (mean)','\Delta I (max)')
 xlabel('\Delta I (nA)');
 ylabel('Counts');
 title('\Delta I (mean) v.s. \Delta I (max)')
 
 
 %4 Scatter plot of dwell_time v.s. Delta I (mean)
 figure(4)
 scatter(storage(:,4),storage(:,7)*1e9); 
 
 hold on 

 xlabel('Dwell Time (\mus)');
 ylabel('\Delta I (nA)');
 title('Dwell time v.s. \Delta I (mean)')
 hold on

%  %5 Scatter plot of dwell_time v.s. STD
 figure(5)
 scatter(storage(:,4),storage(:,10)*1e9);
 hold on
 
 x = [0 90];
 y = [mean(storage(:,6)*1e9) mean(storage(:,6)*1e9)];
 line(x,y,'LineStyle','--');
 xlabel('Dwell Time (\mus)');
 ylabel('Irms (nA)');
 title('Dwell time v.s. event Irms')
 
% 6 Scatter plot of Block percentage v.s. STD
 figure(6)
 scatter(storage(:,8)*100,storage(:,10)*1e9);
 hold on
 xlim([0 40]);
 set(gca,'yscale','log');
 xlabel('blockage percentage (%)');
 ylabel('Irms (nA)');
 title('Blockage percentage v.s. Irms')

 
 
 %%
%  %7 Potential Thickness versus pore size
%  I_expected = Vbias*molerity*(4*thickness/(pi*diameter^2)+1/diameter)^-1
%  f(d) = (pi*d^2/4)*(Vbias*molerity/storage(:,5)-(1/d));
%  fplot(f,[1e-9 4e-9])
%  
%  figure(7)
%  syms d t
%  f =  (pi*d^2/4)*(Vbias*molerity/storage(:,5)-1/d)-t;
%  fimplicit(f,[1e-9 8e-9 0 8e-9])
%  hold on;
%  g = (mean(storage(:,7))/(Vbias*molerity))+(4*t/(pi*(d^2-ssDNA^2))+1/sqrt(d^2-ssDNA^2))^(-1)-((4*t/(pi*d^2))+1/d)^(-1);
%  fimplicit(g,[1e-9 8e-9 0 8e-9])
%  use blockage percentage to back calculate diamter and then thickness
%  xlabel('Pore Diameter (m)');
%  ylabel('Thickness (m)');
%  title('Thickness v.s. Diameter')
 
 %%
 figure(8)
 scatter3(storage(:,4),storage(:,8)*100,storage(:,10)*10^9)
 xlabel('Dwell time (us)');
 ylabel('blockage percentage (%)');
 zlabel('Irms (nA)');
 
% figure(9)
 %scatter(storage(:,9)*100,storage(:,11),'filled');
 %hold on
 %x = [0 100];
 
 %axis([0 100 0 30])
 %y = [mean(storage(:,6)*1e9) mean(storage(:,6)*1e9)];
 %line(x,y,'Color','blue','LineStyle','--');
% xlabel('Blockage percentage (%)');
 %ylabel('SNR');
 %title('\Delta I (max) v.s. SNR')
 
 figure(9)
 scatter(storage(:,8)*100,storage(:,11),'filled');
 hold on
 
 %x = [0 100];
 
 axis([0 50 0 200])
 %y = [mean(storage(:,6)*1e9) mean(storage(:,6)*1e9)];
 %line(x,y,'Color','blue','LineStyle','--');
 set(gca,'yscale','log')
 xlabel('Blockage percentage (%)');
 ylabel('SNR');
 title('Blockage percentage (%) v.s. SNR')
%  
%  
%  % Irms vs Dwell_time
 figure(10)
 scatter(storage(:,4),storage(:,10)*10^9,'filled');
 hold on

 %x = [1 100];
 %y = [mean(storage(:,6)*1e9) mean(storage(:,6)*1e9)];
 %semilogx(x,y,'Color','blue','LineStyle','--');
 %xlabel('dwell time');
 %ylabel('Irms');
 set(gca,'xscale','log')
 %axis([0 100 0 7])
 
 title('Irms v.s. Dwell time')
%  
%  
%  figure(11)
%  scatter(storage(:,4),storage(:,11),'filled');
%  hold on
%  %x = [0 100];
%  
%  set(gca,'xscale','log')
%  
%  %scatter(storage(:,4),storage(:,13),'filled');
%  
%  %axis([0 100 0 30])
%  %y = [mean(storage(:,6)*1e9) mean(storage(:,6)*1e9)];
%  %line(x,y,'Color','blue','LineStyle','--');
%  
%  title('SNR intra event(by min) v.s. Dwell time')
%  
%  
%  
%  
%  % SNRIrms(by mean) vs Dwell_time
%  figure(12)
%  scatter(storage(:,4),storage(:,14),'filled');
%  hold on
 
 %x = [1 100];
 %y = [mean(storage(:,6)*1e9) mean(storage(:,6)*1e9)];
 %semilogx(x,y,'Color','blue','LineStyle','--');
 %xlabel('dwell time');
 %ylabel('Irms');
%  set(gca,'xscale','log')
%  title('SNRIrms(by mean) vs Dwell_time')
 %axis([0 100 0 7])

 %%
 avg = [];
 avg0= [];
 for i = 1:length(storage)
     if storage(i,11)==0
        avg0 = [i,avg0];
     elseif storage(i,11)>100
        avg0 = [i,avg0];
     else
         avg = [avg,storage(i,11)];
     end
 end
 %SNR_by_min
 SUM(1,1)= mean(avg);
 %SNR_error_min
 SUM(2,1)= std(avg);
 
 avg_mean = [];
 avg0_mean= [];
 for i = 1:length(storage)
     if storage(i,14)==0
        avg0_mean = [i,avg0_mean];
     elseif storage(i,11)>100
        avg0 = [i,avg0];
     else
         avg_mean = [avg_mean,storage(i,14)];
     end
 end
 
 figure(13)
 plot(TwoMHz(:,2))
 hold on
 

 figure(14)
 bin_edges_14 = 0:5:400;
 histogram(storage(:,4),bin_edges_14); 
 fig14_c = histc(storage(:,4),bin_edges_14);
 hold on 
 
 %SNR_by_mean 
 SUM(3,1) = mean(avg_mean);
 %SNR_error_mean 
 SUM(4,1) = std(avg_mean);
 
 %SNR_baseline_mean 
 SUM(5,1)= mean(storage(:,13));
 
 %SNR_baseline_mean_error 
 SUM(6,1)= std(storage(:,13));
 
 
 %SNR_baseline_min
 SUM(7,1)= mean(storage(:,15));
 
 %SNR_baseline_min_error 
 SUM(8,1)= std(storage(:,15));
 
 
 %Blockage_percentage_measured 
 SUM(9,1)= mean(storage(:,8));
 
 %Blockage_percentage_std 
 SUM(10,1)= std(storage(:,8));
 
 %Delta_I by mean
 SUM(11,1) = mean(storage(:,7)*10^9);
 
 %I0 
 SUM(12,1) = mean(storage(:,5)*10^9);
 
 %Irms_intra_event
 
 avg = [];
 avg0= [];
 for i = 1:length(storage)
     if storage(i,10)==0
        avg0 = [i,avg0];
     else
         avg = [avg,storage(i,10)];
     end
 end
 %Irms_intra_event
 
 SUM(13,1) = mean(avg*10^9);
 
 

