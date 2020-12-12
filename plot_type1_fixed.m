%plotting length vs. depth scatterplot

%WHAT I"M GOING TO DO: 
% - take in cat1backgrounds, if the values outside (from 30:end - 30 or
% something) average value is less than say 0.5 * 10^-9 then say no
% - take in cat3_inputs and backgrounds, if the values (1:30 and end-30:end) outside are greater
% than the thing again then yeah no, if the values of cat3_averages of the
% depths are within 0.3 of each other than add it to the new plot
% - do the same with cat2_inputs and backgrounds
% - do the same with cat4_inputs and backgrounds (if max(depth) -
% min(depth) is less than 0.3? then add it in


%what do we need: the length of the event, the depth of the event, the x of
%the event
running_list_of_events = cell(7, 0);
block_1 = 0;
block_2 = 0;
block_3 = 0;
block_4 = 0;
base_limit = 1.0*10^-10;

%% first refining cat1

for x = 1:length(cat1_background)
    index = cat1_indices{x};
    background = cat1_background{x};
    edges = [background(1:30); background(end-30:end)];
    if abs(mean(edges)) > base_limit
        disp("blocked Type 1")
        block_1 = block_1 + 1;
        continue
    else
        running_list_of_events(:, end+1) = mydata(:, index);
    end
end

%% then refining cat2

for x = 1:length(cat2_background)
    index = cat2_indices{x};
    background = cat2_background{x};
    edges = [background(1:30); background(end-30:end)];
    
    if abs(mean(edges)) > base_limit || abs(cat2_averages(x, 1) - cat2_averages(x, 2)) > 2*10^-10
        disp("blocked Type 2")
        block_2 = block_2 + 1;
        continue
    else
        new_length = cat2_lengths(x, 1) + cat2_lengths(x, 2);
        first_ratio = cat2_lengths(x, 1)/(cat2_lengths(x, 1) + cat2_lengths(x, 2));
        second_ratio = 1 - first_ratio;
        new_average = first_ratio*cat2_averages(x, 1) + second_ratio*cat2_averages(x, 2);
        running_list_of_events(:, end+1) = {mydata{1, index};mydata{2, index};mydata{3, index}; 2; {new_length}; {new_average}; index};
    end
end

%% then refining cat3
cat3_lengths = cell2mat(vertcat(cat3_data{5, :}));

for x = 1:length(cat3_background)
    index = cat3_indices{x};
    background = cat3_background{x};
    edges = [background(1:30); background(end-30:end)];
    
    if abs(mean(edges)) > base_limit || abs(cat3_averages(x, 1) - cat3_averages(x, 2)) > 2*10^-10
        disp("blocked Type 3")
        block_3 = block_3 + 1;
        continue
    else
        new_length = cat3_lengths(x, 1) + cat3_lengths(x, 2);
        first_ratio = cat3_lengths(x, 1)/(cat3_lengths(x, 1) + cat3_lengths(x, 2));
        second_ratio = 1 - first_ratio;
        new_average = first_ratio*cat3_averages(x, 1) + second_ratio*cat3_averages(x, 2);
        running_list_of_events(:, end+1) = {mydata{1, index};mydata{2, index};mydata{3, index}; 3; {new_length}; {new_average}; index};
    end
end

%% then refining cat4
cat4_background = cat4_data(2, :);
cat4_averages = cell2mat(vertcat(cat4_data{6, :}));
cat4_lengths = cell2mat(vertcat(cat4_data{5, :}));
cat4_indices = cat4_data(7, :);

for x = 1:length(cat4_background)
    index = cat4_indices{x};
    background = cat4_background{x};
    edges = [background(1:30); background(end-30:end)];
    
    if abs(mean(edges)) > base_limit || abs(max(cat4_averages(x, :)) - min(cat4_averages(x, :))) > 2*10^-10
        disp("blocked Type 4")
        block_4 = block_4 + 1;
        continue
    else
        new_length = sum(cat4_lengths(x, :));
        first_ratio = cat4_lengths(x, 1)/(cat4_lengths(x, 1) + cat4_lengths(x, 2) + cat4_lengths(x, 3));
        second_ratio = cat4_lengths(x, 2)/(cat4_lengths(x, 1) + cat4_lengths(x, 2) + cat4_lengths(x, 3));
        third_ratio = cat4_lengths(x, 3)/(cat4_lengths(x, 1) + cat4_lengths(x, 2) + cat4_lengths(x, 3));
        new_average = first_ratio*cat4_averages(x, 1) + second_ratio*cat4_averages(x, 2) + third_ratio*cat4_averages(x, 3);
        running_list_of_events(:, end+1) = {mydata{1, index};mydata{2, index};mydata{3, index}; 4; {new_length}; {new_average}; index};
    end
end

disp("Blocked 1: " + block_1 + " / " + length(cat1_data));
disp("Blocked 2: " + block_2 + " / " + length(cat2_data));
disp("Blocked 3: " + block_3 + " / " + length(cat3_data));
disp("Blocked 4: " + block_4 + " / " + length(cat4_data));
