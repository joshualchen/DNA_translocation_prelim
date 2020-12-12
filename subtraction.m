% finding the event by checking the differences
for event = 1:153
clf;
hold off;
input = mydata{1, event};

sub = zeros(length(input)-1, 1);

for x = 1:length(input)-1
    sub(x) = input(x+1) - input(x);
end


plot(input);
hold on;
plot(sub);
end