
% close all
% clear all
% %A = csvread('200mV_1MKCl_2uM_20190916_165922_EXPORT.csv',9000000,0,[9000000,0,10000000,1]);
% %TwoMHz1 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163341_EXPORT.csv',1,0);
% %TwoMHz2 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163344_EXPORT.csv',1,0);
% %TwoMHz3 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163346_EXPORT.csv',1,0);
% %TwoMHz4 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163349_EXPORT.csv',1,0);
% TwoMHz5 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163351_EXPORT.csv',1,0);
% TwoMHz6 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163354_EXPORT.csv',1,0);
% TwoMHz7 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163356_EXPORT.csv',1,0);
% TwoMHz8 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163359_EXPORT.csv',1,0);
% TwoMHz9 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163401_EXPORT.csv',1,0);
% TwoMHz10 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163404_EXPORT.csv',1,0); %(one sticking event)
% %TwoMHz11 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163406_EXPORT.csv',1,0);
% TwoMHz12 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163409_EXPORT.csv',1,0); %(one sticking event)
% TwoMHz13 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163411_EXPORT.csv',1,0);
% TwoMHz14 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163414_EXPORT.csv',1,0); %(Export 1 sec)
% TwoMHz15 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163416_EXPORT.csv',1,0);
% TwoMHz16 = csvread('ALD_window_1MKCl_2uM_ZY-dC_-500mV_20200820_163419_EXPORT.csv',1,0);
%TwoMHz0 = csvread('Pore2_5000bps_1MKCl_-200mV_20201027_174152_EXPORT.csv',1,0);

% file_start = "Pore2_5000bps_1MKCl_-200mV";
% Files = dir(file_start + '*.csv');
% TwoMHz_wrap = [];
% 
% for file = 1:length(Files)
%     addFile = csvread(Files(file).name, 1, 0);
%     addFile_med = smoothdata(addFile(:, 2), 'movmed', 7500);
%     addSignal = addFile(:, 2) - addFile_med;
%     TwoMHz_wrap = [TwoMHz_wrap; addFile(:, 1), addSignal];
%     disp(file+"/"+length(Files)+" Loaded " + Files(file).name);
% end
    

%% Merge Files 
%TwoMHz = [TwoMHz1;TwoMHz2;TwoMHz4;TwoMHz5;TwoMHz6;TwoMHz7;TwoMHz8;TwoMHz9;TwoMHz10;TwoMHz11;TwoMHz12;TwoMHz13;TwoMHz14;TwoMHz15;TwoMHz16;TwoMHz17;TwoMHz18;TwoMHz19;TwoMHz20;TwoMHz21;TwoMHz22;TwoMHz23;TwoMHz24;TwoMHz25;TwoMHz26;TwoMHz27;TwoMHz28;TwoMHz29;TwoMHz30;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16;TwoMHz16];
%TwoMHz = [TwoMHz5;TwoMHz6;TwoMHz7;TwoMHz8;TwoMHz9;TwoMHz10;TwoMHz12;TwoMHz13;TwoMHz14;TwoMHz15;TwoMHz16];
TwoMHz = TwoMHz_wrap;
% TwoMHz = [TwoMHz3];
TwoMHz(:,2) = -TwoMHz(:,2);
disp("TwoMHz set")

%%
% plot(TwoMHz(:,2))
% plot(TwoMHz(:,4))
%%
I0_2MHz = mean(TwoMHz(:,2));
disp("mean calculated")
Irms_2MHz = std(TwoMHz(:,2));
disp("std calculated")
%%
Sigma = 4;
Threshold_2MHz = I0_2MHz-Sigma*Irms_2MHz;

%n is collecting all the values that are just at the transition from
%acceptable (outside of "noise") to not acceptable (within noise?)
n=[];
o=[];
for i = 2:length(TwoMHz)
    if TwoMHz(i,2) < Threshold_2MHz && TwoMHz(i-1,2) > Threshold_2MHz
       TwoMHz(i,3) = 1; %1 = transition to outside noise
       n=[n;i];
    elseif TwoMHz(i,2) > Threshold_2MHz && TwoMHz(i-1,2) < Threshold_2MHz
       TwoMHz(i-1,3) = 2; %2 = transition to inside noise
       o=[o;i];
    end
    %disp("Inserted n & o: " + i + " of " + length(TwoMHz));
end
disp("Created n and o arrays")
%%
j=1;
k=1;
baseline_threshold = -2.5e-10;
cat1_data = cell(7, 0);
cat2_data = cell(7, 0);
cat3_data = cell(7, 0);
cat4_data = cell(7, 0);
while j < length(n)
    %req1 = o(j)-2 > n(j)+1; %to avoid a *single* rogue data point? check if it's actually before
    %statement1 = mean([TwoMHz(n(j)-30:n(j)-10,2);TwoMHz(o(j)+10:o(j)+30,2)]); %The mean of 20 values before and the values after the event
    %statement2 = mean(TwoMHz(n(j)+1:o(j)-2,2)); %The mean of the values within the event?
    %statement3 = Sigma*Irms_2MHz; %the amount times the standard deviation, a measure of spread?
    %req2 = statement1 - statement2 > statement3; %basically, if on average the values still lie outside of the noise
    req1 = 1;
    if req1% && req2
        if j == 1
            left_o = 1;
        else
            left_o = o(j-1);
        end
        val_subtract = find(flip(TwoMHz(left_o:n(j),2)>=baseline_threshold), 1);
        event_left = n(j) - val_subtract + 2;
        
        l = 0;
        while ~any(TwoMHz(o(j+l):n(j+l+1),2)>=baseline_threshold)
            l = l + 1;
        end
        val_add = find(TwoMHz(o(j+l):n(j+l+1),2)>=baseline_threshold, 1);
        event_right = o(j+l) + val_add - 2;
        
        mydata{1,k} = TwoMHz(event_left:event_right,2); %storing the values within the event
        mydata{2,k}= TwoMHz(event_left-30:event_right+30, 2);
        mydata{3,k} = [TwoMHz(event_left-30:event_left-10,2);TwoMHz(event_right+10:event_right+30,2)]; %storing the values before and after the event
        mydata{4,k} = categorize(mydata{1,k});
        [lengths, averages] = character(mydata{1, k}, mydata{4, k});
        mydata{5,k} = lengths;
        mydata{6,k} = averages;
        mydata{7,k} = k;
        category = mydata{4, k};
        if category == 1
            cat1_data(:, end+1) = mydata(:, k);
        elseif category == 2
            cat2_data(:, end+1) = mydata(:, k);
        elseif category == 3
            cat3_data(:, end+1) = mydata(:, k);
        elseif category == 4
            cat4_data(:, end+1) = mydata(:, k);
        end
        disp("Event " + j + " of " + length(n) + " stored");
        j = j + l + 1;
        k=k+1;
    else
        j = j + 1;
        disp("didn't pass req for some reason")
    end
end

idx_inputs = 1;
idx_background = 2;
idx_edges = 3;
idx_category = 4;
idx_lengths = 5;
idx_averages = 6;
idx_indices = 7;

%beep
%return

%%
% plot the number of each type of event
figure(15)
event_types = cell2mat(mydata(idx_category, :));
histogram(event_types);
xlabel('Event Type');
ylabel('Counts');
title('Distribution of Event Types')

figure(16) % plotting lengths for category 2
cat2_lengths = cell2mat(vertcat(cat2_data{idx_lengths, :}));
cat2_inputs = cat2_data(idx_inputs, :);
cat2_background = cat2_data(idx_background, :);
cat2_indices = cat2_data(idx_indices, :);
clickableScatter(cat2_lengths(:, 1), cat2_lengths(:, 2), cat2_inputs, cat2_background, cat2_indices);
xlabel('Length of Preceding Deep Event');
ylabel('Length of Succeeding Shallow Event');
title('Category 2, Event Lengths Compared')

figure(17); % plotting depths for category 2
cat2_averages = cell2mat(vertcat(cat2_data{idx_averages, :}));
cat2_inputs = cat2_data(idx_inputs, :);
cat2_background = cat2_data(idx_background, :);
cat2_indices = cat2_data(idx_indices, :);
cat2_lengths = cell2mat(vertcat(cat2_data{idx_lengths, :}));
cat2_scores = cellfun(@min, cat2_inputs);
clickableScatter(cat2_averages(:, 1), cat2_averages(:, 2), cat2_inputs, cat2_background, cat2_indices, cat2_scores);
xlabel('Depth of Preceding Deep Event (A)');
ylabel('Depth of Succeeding Shallow Event (A)');
title('Category 2, Event Depths Compared')
colorbar;
set(gca, 'ColorScale', 'log')

figure(18) % plotting length vs depth for category 1
cat1_lengths = cell2mat(vertcat(cat1_data{idx_lengths, :}));
cat1_averages = cell2mat(vertcat(cat1_data{idx_averages, :}));
cat1_inputs = cat1_data(idx_inputs, :);
cat1_background = cat1_data(idx_background, :);
cat1_indices = cat1_data(idx_indices, :);
%cat1_scores = cellfun(@scoreFunc, cat1_inputs.');
clickableScatter(cat1_lengths, cat1_averages, cat1_inputs, cat1_background, cat1_indices);%, cat1_scores);
xlabel('Length of Event');
ylabel('Depth of Event (A)');
title('Category 1, Length vs. Depth')
%colorbar;

figure(19); % plotting depths for category 3
cat3_averages = cell2mat(vertcat(cat3_data{idx_averages, :}));
cat3_inputs = cat3_data(idx_inputs, :);
cat3_background = cat3_data(idx_background, :);
cat3_indices = cat3_data(idx_indices, :);
clickableScatter(cat3_averages(:, 1), cat3_averages(:, 2), cat3_inputs, cat3_background, cat3_indices);
xlabel('Depth of Preceding Shallow Event (A)');
ylabel('Depth of Succeeding Deep Event (A)');
title('Category 3, Event Depths Compared')

%% plotting specific graphs

figure(20) % plotting length vs depth for category 1
ca1_data = running_list_of_events;
ca1_lengths = cell2mat(vertcat(ca1_data{idx_lengths, :}));
ca1_averages = cell2mat(vertcat(ca1_data{idx_averages, :}));
ca1_inputs = ca1_data(idx_inputs, :);
ca1_background = ca1_data(idx_background, :);
ca1_indices = ca1_data(idx_indices, :);
%cat1_scores = cellfun(@scoreFunc, cat1_inputs.');
clickableScatter(ca1_lengths, ca1_averages*10^9, ca1_inputs, ca1_background, ca1_indices);%, cat1_scores);
xlabel('Duration of Event (μs)');
ylabel('Depth of Event (nA)');
title('Type 1 Event Length vs. Depth')

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
n=1; %this step is filling up information about each event
for k = 1:length(mydata)
    l = length(mydata{1,k}); %l is the length of the actual event
    data_temp = mydata{1,k};
    data_temp_I = data_temp(:,1);
    T = 1*1e-6; %temperature?
    data_temp_baseline = mydata{2,k}; %again, the stuff before and after the event
    if length(data_temp_I) > 2 && length(data_temp_I) < 400 %&& std(data_temp_I)^2-std(data_temp_baseline)^2 > 0 %this part might need to change if the events can be very long
        storage(n,1)= mean(data_temp_I);
        storage(n,2)= min(data_temp_I);
        storage(n,3)= std(data_temp_I);
        storage(n,4)= length(data_temp_I)*T*10^6; % dwell_time
        storage(n,5)= mean(data_temp_baseline); % the average value of the baseline for the event
        storage(n,6)= std(data_temp_baseline);
        storage(n,7)= mean(data_temp_baseline)-mean(data_temp_I); %delta_I_by_mean %basically dI
        storage(n,8)= (mean(data_temp_baseline)-mean(data_temp_I))/mean(data_temp_baseline); %percentage of blockage by mean, dI/I
        storage(n,9)= (mean(data_temp_baseline)-min(data_temp_I))/mean(data_temp_baseline); %percentage of blockage (by min)
        if std(data_temp_I)^2-std(data_temp_baseline)^2 > 0 %if there is more deviation in the event than in the other stuff (a lot)
            storage(n,10)= sqrt(std(data_temp_I)^2-std(data_temp_baseline)^2);
            storage(n,11)= (mean(data_temp_baseline)-min(data_temp_I))/sqrt(std(data_temp_I)^2-std(data_temp_baseline)^2);
            %SNR_intra_event(by min)
        else %otherwise, there is less noise in the event
            storage(n,10)=0;
            storage(n,11)=0;
        end
        storage(n,12)= (mean(data_temp_baseline)-min(data_temp_I)); %just the maximum depth of the event
        
        storage(n,13)= (mean(data_temp_baseline)-min(data_temp_I))/std(data_temp_baseline); %depth divided by noise?
        %SNR_baseline (by min)
        if std(data_temp_I)^2-std(data_temp_baseline)^2 > 0 %again, if there is more noise in the event?
            storage(n,14)=(mean(data_temp_baseline)-mean(data_temp_I))/sqrt(std(data_temp_I)^2-std(data_temp_baseline)^2);
            %SNR_intra_event(by mean) %some sort of formula, CAN GET CLARIFICATION IF NECESSARY
            
        else
            storage(n,14)=0;
        end
        storage(n,15)=(mean(data_temp_baseline)-mean(data_temp_I))/std(data_temp_baseline);
        %SNR_baseline(by mean)
        n=n+1;
        
    end
end

figure(11)
%bin_edges = -0.4:10
histogram(hist_event);
title("For All Event Types");

figure(12)
histogram(vertcat(cat2_data{1, :}));
title("Type 2")

%%

 I_measured = mean(storage(:,5));
 Delta_I_measured = mean(storage(:,7)); %the average of all of the events
 Blockage_percentage_measured = mean(storage(:,8)); %the average percentage blockage for all events
 
 bin_edges = 1.0e-08*0.1:1.0e-08*0.05:1.0e-08;
 %1 Histogram of Percentage blockage_mean
 %figure(1)
 bin_edges_1 = 0:5:100;
 histogram(storage(:,8)*100,bin_edges_1);
 hold on

 xlabel('blockage percentage %');
 ylabel('Counts');
 title('Percentage blockage (mean)')
 
 %2 Histogram of Delta I
 %figure(2)
 bin_edges_2 = 0:0.1:5;
 histogram(storage(:,7)*10^9,bin_edges_2);
 fig2_c = histc(storage(:,7)*10^9,bin_edges_2);
 hold on

 xlabel('\Delta I (nA)');
 ylabel('Counts');
 title('\Delta I (mean)')
 
%  %3 Histogram of Delta I by min and mean
%  figure(3)
%  bin_edges_3 = 0.5:0.1:2.5;
%  histogram(storage(:,7)*10^9,bin_edges_3,'FaceColor','b');
%  hold on
%  histogram(storage(:,12)*10^9,bin_edges_3,'FaceColor','r');
%  legend('\Delta I (mean)','\Delta I (max)')
%  xlabel('\Delta I (nA)');
%  ylabel('Counts');
%  title('\Delta I (mean) v.s. \Delta I (max)')
%  
 
 %4 Scatter plot of dwell_time v.s. Delta I (mean)
 %figure(4)
 scatter(storage(:,4),storage(:,7)*1e9); 
 
 hold on 
 sctplot(:,1) = storage(:,4);
 sctplot(:,2) = storage(:,7)*1e9;
 csvwrite('2uM_-500mV_100kHz_dC.csv', sctplot);
 xlabel('Dwell Time (\mus)');
 ylabel('\Delta I (nA)');
 title('Dwell time v.s. \Delta I (mean)')
 hold on

%  %5 Scatter plot of dwell_time v.s. STD
%  figure(5)
%  scatter(storage(:,4),storage(:,10)*1e9);
%  hold on
%  
%  x = [0 90];
%  y = [mean(storage(:,6)*1e9) mean(storage(:,6)*1e9)];
%  line(x,y,'LineStyle','--');
%  xlabel('Dwell Time (\mus)');
%  ylabel('Irms (nA)');
%  title('Dwell time v.s. event Irms')
%  
%  %6 Scatter plot of Block percentage v.s. STD
%  figure(6)
%  scatter(storage(:,8)*100,storage(:,10)*1e9);
%  hold on
%  
%  xlabel('blockage percentage (%)');
%  ylabel('Irms (nA)');
%  title('Blockage percentage v.s. Irms')
 
 
 
 %%
 %7 Potential Thickness versus pore size
 %I_expected = Vbias*molerity*(4*thickness/(pi*diameter^2)+1/diameter)^-1
 %f(d) = (pi*d^2/4)*(Vbias*molerity/storage(:,5)-(1/d));
 %fplot(f,[1e-9 4e-9])
 
 %figure(7)
 %syms d t
 %f =  (pi*d^2/4)*(Vbias*molerity/storage(:,5)-1/d)-t;
 %fimplicit(f,[1e-9 8e-9 0 8e-9])
 %hold on;
 %g = (mean(storage(:,7))/(Vbias*molerity))+(4*t/(pi*(d^2-ssDNA^2))+1/sqrt(d^2-ssDNA^2))^(-1)-((4*t/(pi*d^2))+1/d)^(-1);
 %fimplicit(g,[1e-9 8e-9 0 8e-9])
 %use blockage percentage to back calculate diamter and then thickness
 %xlabel('Pore Diameter (m)');
 %ylabel('Thickness (m)');
 %title('Thickness v.s. Diameter')
 
 %%
 %figure(8)
 %scatter3(storage(:,4),storage(:,7),storage(:,3))
 %xlabel('Dwell time (us)');
 %ylabel('\Delta I (nA)');
 %zlabel('Irms (nA)');
 
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
 
%  figure(9)
%  scatter(storage(:,8)*100,storage(:,11),'filled');
%  hold on
%  
%  %x = [0 100];
%  
%  axis([0 100 0 30])
%  %y = [mean(storage(:,6)*1e9) mean(storage(:,6)*1e9)];
%  %line(x,y,'Color','blue','LineStyle','--');
%  xlabel('Blockage percentage (%)');
%  ylabel('SNR');
%  title('\Delta I (max) v.s. SNR')
%  
%  
%  % Irms vs Dwell_time
%  figure(10)
%  scatter(storage(:,4),storage(:,10)*10^9,'filled');
%  hold on
% 
%  %x = [1 100];
%  %y = [mean(storage(:,6)*1e9) mean(storage(:,6)*1e9)];
%  %semilogx(x,y,'Color','blue','LineStyle','--');
%  %xlabel('dwell time');
%  %ylabel('Irms');
%  set(gca,'xscale','log')
%  %axis([0 100 0 7])
%  
%  title('Irms v.s. Dwell time')
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
 set(gca,'xscale','log')
 title('SNRIrms(by mean) vs Dwell_time')
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
 bin_edges_14 = 0:15:400;
 histogram(storage(:,4),bin_edges_14); %plotting the dwell time
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
 