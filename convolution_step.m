% input: a list of values and that's it

% in this case, input is mydata{1, 1}

x = 3;

%data = mydata;
data = potentials;
min_data = 1;
max_data = length(data);
fig1 = figure;


while true
    %ax = gca;
    displayGraph(x, data{7, x}, data{1, x}, data{2, x})
    %pause(2);
    w = waitforbuttonpress;
    if w == 1
    value = double(get(gcf, 'CurrentCharacter'));
    if value == 29
        if withinBounds(x+1, min_data, max_data)
            x = x + 1;
        end
        displayGraph(x, data{7, x}, data{1, x}, data{2, x})
    elseif value == 28
        if withinBounds(x-1, min_data, max_data)
            x = x - 1;
        end
        displayGraph(x, data{7, x}, data{1, x}, data{2, x})
    end
    end
    clear fig1;
end

function displayGraph(index, x, input, background)
    %clf 
    hold off;
    plot(background*10^9, 'Color', [0.9290 0.6940 0.1250], 'DisplayName', "background")
    d = input.';
    %d = d - mean(d);
    %step = [ones(1, length(d)), -1*ones(1, length(d))];
    %d_step = conv(step, d, 'valid');
    shift = 30;
    d_shift = shift + (1:length(d));
    hold on;
    plot(d_shift, d*10^9, 'Color', 'b', 'DisplayName', 'signal')

    %plot(d_step*10^9, 'DisplayName', 'step')
    category = categorize(input);
    if category ~= 0
        [lengths, averages] = character(input, category);
        running_length = 1;
        for step_num = 1:length(lengths)
            y = averages{step_num} - mean(input.');
            line([running_length+shift, lengths{step_num}+running_length+shift], [y+mean(d), y+mean(d)]*10^9, 'Color','red', 'LineStyle','--');
            running_length = running_length + lengths{step_num} - 1;
        end
    end
    ylim([-5, 0.2]);
    title(index + ", Event "+x+", Category: "+category);
    xlabel("Data Step (index)")
    ylabel("Signal, centered about 0 (nA)")
    legend
    %datacursormode;
end

function bool = withinBounds(val, min, max)
    if val < min || val > max
        bool = 0;
    else
        bool = 1;
    end
end