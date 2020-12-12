function [return_idx, scores] = shift_extrema(step, type)
if type == 'max'
    maxes = find(islocalmax(step));
    scores = zeros(1, length(maxes));
    comparison = [1 find(islocalmin(step)) length(step)];
    for x = 1:length(maxes)
        idx = maxes(x);
        left_min = max(comparison(comparison <= idx));
        right_min = min(comparison(comparison >= idx));
        left_sum = step(idx) - step(left_min);
        right_sum = step(idx) - step(right_min);
        scores(x) = left_sum + right_sum;
    end
    [~, idx_idx] = max(scores);
    return_idx = maxes(idx_idx);
elseif type == 'min'
    mins = find(islocalmin(step));
    scores = zeros(1, length(mins));
    comparison = [1 find(islocalmax(step)) length(step)];
    for x = 1:length(mins)
        idx = mins(x);
        left_max = max(comparison(comparison <= idx));
        right_max = min(comparison(comparison >= idx));
        left_sum = step(left_max) - step(idx);
        right_sum = step(right_max) - step(idx);
        scores(x) = left_sum + right_sum;
    end
    [~, idx_idx] = max(scores);
    return_idx = mins(idx_idx);
end
end