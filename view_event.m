%TO RUN THIS, MUST PUT A BREAKPOINT ON LINE 4
for x = 1:153

clf
hold off

event_num = x;
event = mydata(1, event_num);

surround = mydata{3, event_num};
surround_x_1 = 1:21;
surround_y_1 = surround(surround_x_1, :);
surround_x_2 = 41+length(event{:}):61+length(event{:});
surround_y_2 = surround(22:42, :);

event_x = 31:30+length(event{:});
poop_x = 31:32+length(event{:});
threshold_y = Threshold_2MHz;

plot(mydata{2, event_num}, 'Color', [0.9290 0.6940 0.1250], 'DisplayName', "background")
hold on
plot(event_x, event{:}, 'DisplayName', "event")
hold on
plot(surround_x_1, surround_y_1, 'Color', 'k', 'DisplayName', "before")
hold on
plot(surround_x_2, surround_y_2, 'Color', 'k', 'DisplayName', "after")
hold on
yline(threshold_y, 'DisplayName', "threshold")
hold on
%plot(poop_x, poopdata{1, event_num}, 'DisplayName', "everything")
line([mean(xlim)-2,mean(xlim)+2],[threshold_y,threshold_y], 'LineWidth', 5*80/max(xlim), 'DisplayName', "5 units")

title("Event "+x);

legend('Location', 'eastoutside')
end