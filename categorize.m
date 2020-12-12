% Given a signal, assign it a category
function category = categorize(input)
signal = input.';
signal = signal - mean(signal);
ones_step = [ones(1, length(signal)), -1*ones(1, length(signal))];
step = conv(ones_step, signal, 'valid');

%only thing to do is switch it from max and min of step to a new function?
min_idx = shift_extrema(step, 'min');%shift_min(step);
max_idx = shift_extrema(step, 'max');%shift_max(step);

category = 0;
begin = 1;
ending = length(signal);

if begin > min_idx || min_idx > ending
    signal_pre = signal(begin);
else
    signal_pre = signal(begin:min_idx);
end

if max_idx > ending || max_idx < begin
    signal_post = signal(ending);
else
    signal_post = signal(max_idx:ending);
end

if min_idx >= max_idx
    category = 0;
elseif ~checkStep(signal_pre, "pre") && ~checkStep(signal_post, "post")
    category = 1;
elseif ~checkStep(signal_pre, "pre") && checkStep(signal_post, "post")
    category = 2;
elseif checkStep(signal_pre, "pre") && ~checkStep(signal_post, "post")
    category = 3;
elseif checkStep(signal_pre, "pre") && checkStep(signal_post, "post")
    category = 4;
end
end

function bool = checkStep(segment, type)
    if length(segment) <= 1
        bool = false;
    else
        diff = segment(2:end)-segment(1:end-1);
        if type == "pre"
            bool = max(diff) > 0 && length(find(diff >= 0)) >= 2; 
        elseif type == "post"
            bool = min(diff) < 0 && length(find(diff <= 0)) >= 2;
        end
    end
end