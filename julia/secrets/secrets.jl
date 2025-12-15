function shift_back(value, amount)
    value >>> amount
end

function set_bits(value, mask)
    value | mask
end

function flip_bits(value, mask)
    value ⊻ mask
end

function clear_bits(value, mask)
    value & ~mask
end
