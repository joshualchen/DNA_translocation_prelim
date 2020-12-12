function score = scoreFunc(input)
original = input.';
signal = original - mean(original);
ones_step = [ones(1, length(signal)), -1*ones(1, length(signal))];
step = conv(ones_step, signal, 'valid');
[~, scores] = shift_extrema(step, 'max');
score = max(scores)/sum(scores);
end