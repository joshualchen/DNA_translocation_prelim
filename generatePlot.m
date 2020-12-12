% input: a list of values and that's it

% in this case, input is mydata{1, 1}

x = 857;
min_data = 1;
max_data = length(mydata);
figure(1)
hold off

%input = mydata{1, x};
background = mydata{2, x};
shift = 20;
x_values = (1:length(background)) + shift;

plot(x_values, background*10^9, 'Color', 'b', 'LineWidth', 1)
%d = input.';
%d = d - mean(d);
%step = [ones(1, length(d)), -1*ones(1, length(d))];
%d_step = conv(step, d, 'valid');
%d_shift = shift + (1:length(d));
hold on;
%plot(d_shift, d*10^9, 'Color', 'b', 'DisplayName', 'signal')

%plot(d_step*10^9, 'DisplayName', 'step')

ylim([-4, 0.5]);
xlim([0, 800]);
title_name = "Type 2 Event, 1.5 to 0.7 nA Depth, " + x;
title(title_name);
xlabel("Time (μs)")
ylabel("Signal Current (nA)")

%saveas(gcf,title_name + '.svg')