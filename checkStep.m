function bool = checkStep(segment, type)
    diff = segment(2:end)-segment(1:end-1);
    if type == "pre"
        bool = max(diff) > 0; 
    elseif type == "post"
        bool = min(diff) < 0;
    end
end