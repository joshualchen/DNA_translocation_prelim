% returns the length of each step (specific to each category) as well as
% the averages of the steps

function [lengths, averages] = character(input, category)
    original = input.';
    signal = original - mean(original);
    ones_step = [ones(1, length(signal)), -1*ones(1, length(signal))];
    step = conv(ones_step, signal, 'valid');

    min_idx = shift_extrema(step, 'min');
    max_idx = shift_extrema(step, 'max');
    TF_max = islocalmax(step);
    TF_min = islocalmax(step);
    begin = 1;
    ending = length(signal);
    within = 9; %check within this value to see where to calculate average
    
    buffer = 3; %buffer region for calculating average (esp for type 2 shallow)
    if category == 1
        lengths = cell(1, 1);
        lengths{1} = ending - begin + 1;
        averages = cell(1, 1);
        averages{1} = mean(original(min_idx:max_idx));
    elseif category == 2
        lengths = cell(1, 2);
        lengths{1} = max_idx - begin + 1;
        lengths{2} = ending - max_idx + 1;
        averages = cell(1, 2);
        if max_idx > ending
            max_idx = ending;
        end
        if max_idx - min_idx + 1 > 2 * buffer 
            min_idx_1 = min_idx + buffer;
            max_idx_1 = max_idx - buffer;
        else
            min_idx_1 = min_idx;
            max_idx_1 = max_idx;
        end
        averages{1} = mean(original(min_idx_1:max_idx_1));
        local_max = within+1-find(TF_max(end-within:end), 1, 'last');
        if isempty(local_max)
            local_max = 0;
        end
        if ending-local_max - max_idx + 1 > 2 * buffer
            max_idx_2 = max_idx + buffer;
            ending_2 = ending - buffer;
        else 
            max_idx_2 = max_idx;
            ending_2 = ending;
        end
        if ending-local_max < max_idx
            averages{2} = mean(original(max_idx_2:ending_2));
        else
            averages{2} = mean(original(max_idx_2:ending_2-local_max));
        end
    elseif category == 3
        lengths = cell(1, 2);
        lengths{1} = min_idx - begin + 1;
        lengths{2} = ending - min_idx + 1;
        averages = cell(1, 2);
        local_min = find(TF_min(1:1+within), 1, 'first');
        if isempty(local_min)
            local_min = 0;
        end
        %WILL NEED TO REWRITE WITH BUFFER IF NECESSARY
        if local_min > min_idx
            averages{1} = mean(original(begin:min_idx));
        else
            averages{1} = mean(original(begin+local_min:min_idx));
        end
        if max_idx > ending
            max_idx = ending;
        end
        averages{2} = mean(original(min_idx:max_idx));
    elseif category == 4
        lengths = cell(1, 3);
        lengths{1} = min_idx - begin + 1;
        lengths{2} = max_idx - min_idx + 1;
        lengths{3} = ending - max_idx + 1;
        averages = cell(1, 3);
        local_min = find(TF_min(1:1+within), 1, 'first');
        if isempty(local_min) || local_min > min_idx
            averages{1} = mean(original(1:min_idx));
        else
            averages{1} = mean(original(local_min:min_idx));
        end
        averages{2} = mean(original(min_idx:max_idx));
        local_max = within+1-find(TF_max(end-within:end), 1, 'last');
        if isempty(local_max) || ending-local_max < max_idx
            averages{3} = mean(original(max_idx:end));
        else
            averages{3} = mean(original(max_idx:end-local_max));
        end
    elseif category == 0
        lengths = cell(0,0);
        averages = cell(0,0);
    end
end
