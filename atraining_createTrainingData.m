% inputs: mydata, that's it
figure(1);

% initialize internal state
event_num = 1;
x_values = mydata{3, event_num};
background = mydata{4, event_num};
event_data_lims = mydata{1, event_num};
x = event_data_lims(1); % need to change it to the actual x position
step_length = range(event_data_lims)/10;
existing_steps = {};
category = "Undecided";

% initialize plot
redraw_1(event_num, x_values, background, x, existing_steps, category);
redraw_2(mydata{1, event_num}, mydata{2, event_num}, TwoMHz(:, 2));

% storing the training data
training_data = cell(5, 0);

while true
    
    waitforbuttonpress;
    value = double(get(gcf, 'CurrentCharacter'));
    if value == 30
        %if up button is pressed
        if withinBounds(x+step_length, event_data_lims(1), event_data_lims(end))
            x = x + step_length;
        end
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 31
        %if down button is pressed
        if withinBounds(x-step_length, event_data_lims(1), event_data_lims(end))
            x = x - step_length;
        end
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 29
        %if right button is pressed
        if withinBounds(x+1, event_data_lims(1), event_data_lims(end))
            x = x + 1;
        end
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 28
        %if left button is pressed
        if withinBounds(x-1, event_data_lims(1), event_data_lims(end))
            x = x - 1;
        end
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 32
        %if space button is pressed
        existing_steps{end+1} = x;
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 48
        %if 0 is pressed
        category = 0;
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 49
        %if 1 is pressed
        category = 1;
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 50
        %if 2 is pressed
        category = 2;
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 51
        %if 3 is pressed
        category = 3;
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 52
        %if 4 is pressed
        category = 4;
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 45
        %if - button is pressed, get rid of last red line
        if not(isempty(existing_steps))
            existing_steps(end) = [];
        end
        redraw_1(event_num, x_values, background, x, existing_steps, category);
    elseif value == 13
        if num2str(category) == "Undecided"
            title("Event #" + event_num + ", Category: " + '\color{red}'+category);
        else
            %if enter button is pressed
            %put everything into the training data structure
            training_data(:, end+1) = {event_num; category; event_data_lims(1); event_data_lims(end); existing_steps};

            %reinitialize all of the variables that change
            event_num = event_num + 1;
            x_values = mydata{3, event_num};
            background = mydata{4, event_num};
            event_data_lims = mydata{1, event_num};
            x = event_data_lims(1); % need to change it to the actual x position
            step_length = range(event_data_lims)/10;
            existing_steps = {};
            category = "Undecided";

            redraw_1(event_num, x_values, background, x, existing_steps, category);
            redraw_2(mydata{1, event_num}, mydata{2, event_num}, TwoMHz(:, 2));
        end
    elseif value == 8
        %if backspace is pressed, go back to previous one
        if withinBounds(event_num - 1, 1, length(mydata))
            event_num = event_num - 1;
            existing_steps = training_data{5, event_num};
            category = training_data{2, event_num};
            training_data(:, end) = [];
        end
        x_values = mydata{3, event_num};
        background = mydata{4, event_num};
        event_data_lims = mydata{1, event_num};
        x = event_data_lims(1); % need to change it to the actual x position
        step_length = range(event_data_lims)/10;
        
        redraw_1(event_num, x_values, background, x, existing_steps, category);
        redraw_2(mydata{1, event_num}, mydata{2, event_num}, TwoMHz(:, 2));
    end
end

function redraw_1(event_num, x_values, background, x, existing_steps, category)
    subplot(1, 2, 1);
    cla;
    hold on;
    plot(x_values, background, 'Color', [0.9290 0.6940 0.1250]);
    plot(x_values(1+40:end-40), background(1+40:end-40), 'Color', 'k');
    cellfun(@drawLine, existing_steps);
    xline(x, '--r');
    
    title("Event #" + event_num + ", Category: " + category);
    xlabel("Time (μs)")
    ylabel("Current Depth (A)");
    xlim([x_values(1), x_values(end)]); % MIGHT NEED TO CHANGE THIS SO IT"S CONSISTENT
    ylim([-3*10^-9 5*10^-10]); % might need to check this
end

function redraw_2(x_values, y_values, fullSignal)
    subplot(1, 2, 2);
    cla;
    hold on;
    window_size = 10000;
    x_middle = range(x_values)/2 + x_values(1);
    x_window = x_middle-window_size/2:x_middle+window_size/2;
    actual_x = round(x_window(x_window>0));
    y_vals = fullSignal(actual_x);
    plot(actual_x, y_vals, 'Color', [0.9290 0.6940 0.1250]);
    plot(x_values, y_values, 'Color', 'k');
    
    title("Zoomed Out [Window Size: 10,000]");
    xlim([x_middle-window_size/2 x_middle+window_size/2]);
    ylim([-3*10^-9 5*10^-10]);
end

function drawLine(x_locs)
    xline(x_locs, 'r');
end

function bool = withinBounds(val, min, max)
    if val < min || val > max
        bool = 0;
    else
        bool = 1;
    end
end