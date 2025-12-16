get_coordinate(line) = line[2]

convert_coordinate(coordinate) =  Tuple(coordinate)

function compare_records(azara_record, rui_record)
    convert_coordinate(get_coordinate(azara_record)) in rui_record
end

function create_record(azara_record, rui_record)
    if(compare_records(azara_record, rui_record))
        treasure, coordinate = azara_record
        location, _, quadrant = rui_record
        return (coordinate, location, quadrant, treasure)
    else
        return()
    end
end
