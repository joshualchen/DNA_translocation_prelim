% debug version in convolution step, this is for real plotting
function displayGraph(x, input, background, plot_figure)
    ax = findobj(plot_figure, 'type', 'axes');
    
    % insert surrounding values
    plot(background, 'Color', [0.9290 0.6940 0.1250], 'DisplayName', "background")
    hold on;
    shift = 30;
    
    d = input.';
    %d_norm = d - mean(d);
    %step = [ones(1, length(d_norm)), -1*ones(1, length(d_norm))];
    %d_step = conv(step, d_norm, 'valid');
    d_shift = shift + (1:length(d));
    plot(ax, d_shift, d, 'DisplayName', 'signal', 'Color', 'b')
    hold on;
    %plot(ax, d_shift, d_step(1:end-1)/10, 'DisplayName', 'step', 'Color', 'g')
    category = categorize(input);
    if category ~= 0
        [lengths, averages] = character(input, category);
        running_length = 1 + shift;
        for step_num = 1:length(lengths)
            y = averages{step_num};
            line(ax, [running_length, lengths{step_num}+running_length], [y, y], 'Color','red', 'LineStyle','--', 'DisplayName', 'step');
            running_length = running_length + lengths{step_num} - 1;
        end
    end
    title("Event "+x+", Category: "+category);
    xlabel("Data Step (index)");
    ylabel("Event Depth (A)");
    legend%('Location', 'eastoutside')
end