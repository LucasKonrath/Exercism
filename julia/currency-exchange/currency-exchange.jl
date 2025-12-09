function exchange_money(budget, exchange_rate)
    return budget / exchange_rate
end

function get_change(budget, exchanging_value)
    return budget - exchanging_value
end

function get_value_of_bills(denomination, number_of_bills)
    return denomination * number_of_bills
end

function get_number_of_bills(amount, denomination)
    return div(amount, denomination)
end

function get_leftover_of_bills(amount, denomination)
    return amount - (get_number_of_bills(amount, denomination) * denomination)
end

function exchangeable_value(budget, exchange_rate, spread, denomination)
    new_exchange_rate = exchange_rate * (1 + spread / 100)
    exchanged_amount = budget / new_exchange_rate
    bills = div(floor(Int, exchanged_amount), denomination)
    return bills * denomination
end
