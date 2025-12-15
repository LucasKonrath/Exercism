function time_to_mix_juice(juice)
    if(juice == "Pure Strawberry Joy")
        return 0.5
    elseif(juice == "Energizer") || (juice == "Green Garden")
        return 1.5
    elseif(juice == "Tropical Island")
        return 3.0
    elseif(juice == "All or Nothing")
        return 5.0
    else
        return 2.5
    end
end

function wedges_from_lime(size)
    if(size == "small")
        return 6
    elseif(size == "medium")
        return 8
    elseif(size == "large")
        return 10
    else
        return 0
    end
end

function limes_to_cut(needed, limes)
   if needed <= 0
        return 0
   end
   for (i, lime) in enumerate(limes)
        needed -= wedges_from_lime(lime)
        if needed <= 0
            return i
        end
    end
    return length(limes)
end

function order_times(orders)
    times = Float64[]
    for order in orders
        push!(times, time_to_mix_juice(order))
    end
    return times
end

function remaining_orders(time_left, orders)
    while time_left > 0 && !isempty(orders)
        time_left -= time_to_mix_juice(first(orders))
        popfirst!(orders)
    end
    return orders
end
