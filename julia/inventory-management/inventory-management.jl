function create_inventory(items)
    inventory = Dict{String, Int}()
    for item in items
        if haskey(inventory, item)
            inventory[item] += 1
        else
            inventory[item] = 1
        end
    end
    return inventory
end

function add_items(inventory, items)
    for item in items
        if haskey(inventory, item)
            inventory[item] += 1
        else
            inventory[item] = 1
        end
    end
    return inventory
end

function decrement_items(inventory, items)
    for item in items
        if haskey(inventory, item) && inventory[item] > 0
            inventory[item] -= 1
        end
    end
    return inventory
end

function remove_item(inventory, item)
    delete!(inventory, item)
    return inventory
end

function list_inventory(inventory)
    available_items = [item => quantity for (item, quantity) in inventory if quantity > 0]
    sort!(available_items, by = p -> p.first)
    return available_items
end
