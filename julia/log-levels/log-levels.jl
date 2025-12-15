split_msg(msg) = split(msg, ": ")

function message(msg) 
    parts = split_msg(msg)
    return strip(parts[2])
end

function log_level(msg)
    return lowercase(strip(replace(split_msg(msg)[1], r"[\[\]]" => "")))
end

function reformat(msg)
    return "$(message(msg)) ($(log_level(msg)))"
end
